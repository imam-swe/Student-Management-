import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_school/screens/teacherScreens/teacherpage.dart';
import 'package:i_school/screens/signinScreens/login_page.dart';

class Teacher_Information extends StatefulWidget {
  const Teacher_Information({Key? key}) : super(key: key);

  @override
  _Teacher_InformationState createState() => _Teacher_InformationState();
}

class _Teacher_InformationState extends State<Teacher_Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae2b7),
      appBar: AppBar(),
      body: Column(
        children: [
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.3,
          //   // child: _image == null ? Text("") : Image.file(_image),
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.01,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     FloatingActionButton(
          //       backgroundColor: Colors.white,
          //       onPressed: () {
          //         cameraImage();
          //       },
          //       child: Icon(
          //         Icons.camera_alt_outlined,
          //         color: Colors.black,
          //       ),
          //     ),
          //     SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.05,
          //     ),
          //     FloatingActionButton(
          //       backgroundColor: Colors.white,
          //       onPressed: () {
          //         galleryImage();
          //       },
          //       child: Icon(
          //         Icons.photo_library_outlined,
          //         color: Colors.black,
          //       ),
          //     )
          //   ],
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 25, right: 25),
          //   child: TextField(
          //     decoration: InputDecoration(hintText: "First Name *"),
          //     onChanged: (input) {
          //       setState(() {
          //         _fname = input;
          //       });
          //     },
          //   ),
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.015,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 25, right: 25),
          //   child: TextFormField(
          //     decoration: InputDecoration(hintText: "Last Name *"),
          //     onChanged: (input) {
          //       setState(() {
          //         _lname = input;
          //       });
          //     },
          //   ),
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.015,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 25, right: 25),
          //   child: TextFormField(
          //     keyboardType: TextInputType.number,
          //     decoration: InputDecoration(hintText: "Class *"),
          //     onChanged: (input) {
          //       setState(() {
          //         _class = input;
          //       });
          //     },
          //   ),
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.015,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 25, right: 25),
          //   child: TextFormField(
          //     keyboardType: TextInputType.number,
          //     decoration: InputDecoration(hintText: "Roll No. *"),
          //     onChanged: (input) {
          //       setState(() {
          //         _roll = input;
          //       });
          //     },
          //   ),
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.015,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 25, right: 25),
          //   child: TextFormField(
          //     keyboardType: TextInputType.text,
          //     decoration: InputDecoration(hintText: "Present Address *"),
          //     onChanged: (input) {
          //       setState(() {
          //         _add = input;
          //       });
          //     },
          //   ),
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.015,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 25, right: 25),
          //   child: TextFormField(
          //     keyboardType: TextInputType.text,
          //     decoration: InputDecoration(hintText: "Guardian Name *"),
          //     onChanged: (input) {
          //       setState(() {
          //         _g_name = input;
          //       });
          //     },
          //   ),
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.015,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 25, right: 25),
          //   child: TextFormField(
          //     keyboardType: TextInputType.phone,
          //     decoration:
          //         InputDecoration(hintText: "Guardian Contact No. *"),
          //     onChanged: (input) {
          //       setState(() {
          //         _g_num = input;
          //       });
          //     },
          //   ),
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.015,
          // ),
          // ignore: deprecated_member_use
          FlatButton(
            color: Colors.orange,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Teacher_page(widget.toString()),
                  ),
                  (route) => false);
              // sendDataStudent();
              // print(auth.tenantId);

              // if (_image == null) {
              //   showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text('Please Pick Your Image'),
              //         );
              //       });
              // } else
              // if (_fname == null) {
              //   showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text('Please Enter your First Name'),
              //         );
              //       });
              // } else if (_lname == null) {
              //   showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text('Please Enter Your Last Name'),
              //         );
              //       });
              // } else if (_class == null) {
              //   showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text('Please Enter Your Class'),
              //         );
              //       });
              // } else if (_roll == null) {
              //   showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text('Please Enter Your Roll No'),
              //         );
              //       });
              // } else if (_add == null) {
              //   showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text('Please Enter Your Present Address'),
              //         );
              //       });
              // } else if (_g_name == null) {
              //   showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text('Please Enter Your Guardian Name'),
              //         );
              //       });
              // } else if (_g_num == null || _g_num.length != 11) {
              //   showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text(
              //               'Please Enter Your Guardian Contact Number'),
              //         );
              //       });
              // } else if (_class == null) {
              //   showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           title: Text('Please Enter Your Class'),
              //         );
              //       });
              // }
            },
            child: Text(
              "Save Information",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
