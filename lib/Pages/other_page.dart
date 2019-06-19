import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_firebase2/Pages/Create.dart';
import 'package:flutter_app_firebase2/Calendar/calendar.dart';
import 'dart:async';


class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  String org, reason;

  getOrg(org){
    this.org = org;
  }

  getReason(reason){
    this.reason=reason;
  }


  int vType=0;
  String vVal;

  void radioVenue(int value){
    setState((){
      vType=value;
      switch(vType){
        case 1:
          vVal = 'PAH';
          break;
        case 2:
          vVal = 'AS Lobby';
          break;
        case 13:
          vVal = 'AVR 1';
          break;
        case 4:
          vVal = 'AVR 2';
          break;
      }
    });
  }

  String id;
  //final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: new Text("Request"),
        backgroundColor: Color(0xFFB83227),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Select Venue: ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Radio(
                            value: 1,
                            groupValue: vType,
                            onChanged: radioVenue,
                            activeColor: Color(0xFFB83227),
                          ),
                          Text ('PAH', style: TextStyle(fontSize: 16.0),)
                        ],
                      ),
                      SizedBox(width: 80.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Radio(
                            value: 2,
                            groupValue: vType,
                            onChanged: radioVenue,
                            activeColor: Color(0xFFB83227),
                          ),
                          Text ('AS Lobby', style: TextStyle(fontSize: 16.0),)
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Radio(
                              value: 3,
                              groupValue: vType,
                              onChanged: radioVenue,
                              activeColor: Color(0xFFB83227),
                            ),
                            Text ('PAH', style: TextStyle(fontSize: 16.0),)
                          ],
                        ),
                        SizedBox(width: 80.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Radio(
                              value: 4,
                              groupValue: vType,
                              onChanged: radioVenue,
                              activeColor: Color(0xFFB83227),
                            ),
                            Text ('AS Lobby', style: TextStyle(fontSize: 16.0),)
                          ],
                        ),
                      ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                      onChanged: (String org){
                        getOrg(org);
                      },
                      decoration: InputDecoration(labelText: "Organization: ")
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                      onChanged: (String reason){
                        getReason(reason);
                      },
                      decoration: InputDecoration(labelText: "Reason for Usage: ")
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Row(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Select Date'),
                        padding: EdgeInsets.all(20.0),
                        onPressed: () => selectDate(context),
                        color: Color(0xFFB83227),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      SizedBox(width: 60.0),
                      RaisedButton(
                        child: Text('Select Time'),
                        padding: EdgeInsets.all(20.0),
                        onPressed: () => selectTime(context),
                        color: Color(0xFFB83227),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Create()));
          var route = new MaterialPageRoute(builder: (BuildContext context) => new Request());
        },
        child: Icon(Icons.add),
        tooltip: "Add a Request",
      ),

    );
  }
  DateTime initDate = new DateTime.now();
  DateTime lDate = new DateTime(2020);
  TimeOfDay time = new TimeOfDay.now();

  Future<Null> selectDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: initDate,
      firstDate: new DateTime(2016),
      lastDate: lDate,
    );
    if(picked != null && picked != initDate){
/*      print('Date selected: ${date.toString()}');
*/      setState((){
        initDate = picked;
      });
    }
  }

  Future<Null> selectTime(BuildContext context) async{
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time,

    );
    if(picked != null && picked != initDate){
/*      print('Date selected: ${date.toString()}');
*/      setState((){
        time = picked;
      });
    }
  }


}

