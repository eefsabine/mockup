import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_firebase2/Pages/Create.dart';
import 'package:flutter_app_firebase2/Calendar/calendar.dart';


class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  String org, reason, date, time;

  getOrg(org){
    this.org = org;
  }

  getReason(reason){
    this.reason=reason;
  }

  getDate(date){
    this.date=date;
  }

  getTime(time){
    this.time=time;
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
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: new Text("Request"),
        backgroundColor: Color(0xFFB83227),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    'Select Venue: ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                RaisedButton(
                  child: Text('Select Date'),
                  padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
                  onPressed: (){},
                  color: Color(0xFFB83227),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                RaisedButton(
                  child: Text('Select Time'),
                  onPressed: (){},
                  color: Color(0xFFB83227),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                //SizedBox(height: 50.0),
              ],
            ),
          ),
        ],
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



}
/*
ButtonTheme(
minWidth: 20.0,
height: 50.0,
child: RaisedButton(
child: Text('Select Date'),
padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
onPressed: (){},
color: Color(0xFFB83227),
textColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(30.0),
),
),
),
*/