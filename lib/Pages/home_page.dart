import 'package:flutter/material.dart';
import './other_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class REQ {
  REQ({this.reqname,this.location,this.type});

  String reqname;
  String location;
  String type;
}
final List<REQ> _req = <REQ>[
  REQ(reqname: "Reserve PAH for org activity", location: "PAH", type: "Free"),
  REQ(reqname: "Reserve AS HALL for org activity", location: "AS", type: "Free"),
  REQ(reqname: "Reserve UP BASCKETBALL COURT for org activity", location: "UP BASKETBALL COURT", type: "Free"),
];

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
    this.user
  }) : super(key: key);
  final FirebaseUser user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("UP CEBU PORTAL"), backgroundColor: Color(0xFFB83227),),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("First M. Last"),
                accountEmail: new Text('Welcome ${widget.user.email}'),
                currentAccountPicture: new GestureDetector(
                  child: CircleAvatar(
                    child:Image.asset('assets/upcebu.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage('assets/upcebu.jpg'),
                    fit: BoxFit.fill
                  ),
                ),
              ),
              new ListTile(
                title: new Text("Requests"),
                trailing: new Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Request()));
                },
              ),
              new ListTile(
                title: new Text("Chenes"),
                trailing:  new Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Request()));
                },
              ),
              new Divider(),
              new ListTile(
                title: new Text("Close"),
                trailing: new Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
        body: new Wrap(
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: _req.length,
                  itemBuilder: (context, index) {
                    final req = _req[index];
                    return Slidable(
                      delegate: SlidableDrawerDelegate(),
                      actionExtentRatio: 0.29,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                        ),
                        subtitle: Text(req.type),
                        title: Text(
                          req.reqname,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          icon: Icons.clear,
                          color: Colors.redAccent,
                        )
                      ],
                    );
                  }
              )
            ]


        )
    );
  }
}
