import 'package:flutter/material.dart';
import 'package:flutter_app_firebase2/Pages/other_page.dart';
import 'dart:async';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  DateTime date = new DateTime.now();
  TimeOfDay time = new TimeOfDay.now();

  Future<Null> selectDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2019),
    );
    if(picked != null && picked != date){
      print('Date selected: ${date.toString()}');
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Text('Date Selected: ${date.toString()}'),
            RaisedButton(
              child: Text('Select Date'),
              onPressed: (){
                selectDate(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
