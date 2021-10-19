import 'package:flutter/material.dart';

// DocumentSnapshot? snapshot;
String firstName = 'loading...';
String lastName = 'loading...';
String imageurl = 'loading...';
String title = 'loading...'; //Define snapshot

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[800],
      width: double.infinity,
      height: 220,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(),
        ],
      ),
    );
  }
}
