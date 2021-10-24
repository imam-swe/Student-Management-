import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//DocumentSnapshot? snapshot;
String firstName = 'loading...';
String lastName = 'loading...';
String imageurl = 'loading...';
String email = 'loading...'; //Define snapshot

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  // Stream<DocumentSnapshot> sNapshot1= FirebaseFirestore.instance.collection('i-student').doc(firebaseUser.uid).snapshots();
  // String? imageurl;

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('i-student');
  dynamic data;
  _fetch() async {
    collectionReference
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      //'value' is the instance of 'DocumentSnapshot'
      //'value.data()' contains all the data inside a document in the form of 'dictionary'
      var fields = value;

      //Using 'setState' to update the user's data inside the app
      //firstName, lastName and title are 'initialised variables'
      setState(() {
        firstName = fields['First_Name'] ?? '';
        lastName = fields['Last_Name'] ?? '';
        imageurl = fields['Image'] ?? '';
        email = fields['E-Mail'] ?? '';
      });
     // print(imageurl.toString() +  '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    });
  }

  @override
  void initState() {
    super.initState();
    _fetch();
    //print(data['Image'].toString());
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
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 150,
              // decoration: BoxDecoration(
              //   shape: BoxShape.circle,
              //   image: DecorationImage(
              //     image: AssetImage('images/smsst.png'),
              //   ),
              // ),

              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(imageurl.toString()),
                  ),
                  Text(
                    firstName.toString() + " " + lastName.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    email.toString(),
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ],
              )

              // child: StreamBuilder(
              //   stream: FirebaseFirestore.instance
              //       .collection("i-student").snapshots(),
              //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //     if (!snapshot.hasData) {
              //       return Text("Loading...");
              //     }
              //     return ListView(
              //       scrollDirection: Axis.vertical,
              //       physics: ScrollPhysics(),
              //       padding: EdgeInsets.only(top: 24),
              //       children: snapshot.data!.docs.map((document) {
              //         Map<String, dynamic> data =
              //             document.data()! as Map<String, dynamic>;
              //         return Column(
              //           children: [
              //             CircleAvatar(
              //               radius: 30.0,
              //               backgroundImage: NetworkImage(
              //                   data["Image"].toString()),
              //             ),
              //             Text(
              //               data["First_Name"].toString(),
              //               style: TextStyle(color: Colors.black, fontSize: 20),
              //             ),
              //             Text(
              //               data["E-Mail"].toString(),
              //               style: TextStyle(
              //                 color: Colors.black87,
              //                 fontSize: 14,
              //               ),
              //             ),
              //           ],
              //         );
              //       }).toList(),
              //     );
              //   },
              // ),
              ),
        ],
      ),
    );
  }
}
