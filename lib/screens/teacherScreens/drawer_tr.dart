import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String firstName = 'loading...';
String lastName = 'loading...';
String imageurl = 'loading...';
String email = 'loading...'; //Define snapshot

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('i-teacher');
  dynamic data;
  _fetch() async {
    collectionReference
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      var fields = value;

      setState(() {
        firstName = fields['First_Name'] ?? '';
        lastName = fields['Last_Name'] ?? '';
        imageurl = fields['Image'] ?? '';
        email = fields['E-Mail'] ?? '';
      });
    });
  }

  void initState(){
    super.initState();
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[800],
      width: double.infinity,
      height: 220,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 150,
            // decoration: BoxDecoration(
            //   shape: BoxShape.circle,
            //   image: DecorationImage(
            //     image: AssetImage('images/smstr.png'),
            //   ),
            // ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(imageurl.toString()),
                  backgroundColor: Colors.white,
                ),
                Text(
                  firstName.toString() + ' ' + lastName.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  email.toString(),
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
