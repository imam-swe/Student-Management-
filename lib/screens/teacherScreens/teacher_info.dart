// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_school/screens/teacherScreens/teacherpage.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:i_school/screens/homepage.dart';

// import 'package:i_school/screens/signinScreens/registration_page.dart';

// ignore: must_be_immutable
class Teacher_Information extends StatefulWidget {
  String email;

  Teacher_Information(this.email);

  @override
  _Teacher_InformationState createState() => _Teacher_InformationState();
}

class _Teacher_InformationState extends State<Teacher_Information> {
  //add gender
  var genderchoose;
  List genderitem = ["Male", "Female", "Others"];
  late String _fname, _lname, _t_id, _add, _t_num;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendDataTeacher() async {
    var imageStorage = FirebaseStorage.instance.ref().child(_image!.path);
    var put = imageStorage.putFile(_image!);
    String imgurl = await (await put).ref.getDownloadURL();

    await (imgurl);
    if (_image != null &&
        _fname != null &&
        _lname != null &&
        genderchoose != null &&
        _t_id != null &&
        _add != null &&
        _t_num != null &&
        _t_num.length == 11) {
      firestore.collection('i-teacher').doc(auth.currentUser!.uid).set({
        'First_Name': _fname,
        'Last_Name': _lname,
        'E-Mail': widget.email,
        'Teacher ID': _t_id,
        'Gender': genderchoose,
        'Address': _add,
        'Contact_Number': _t_num,
        'Image': imgurl
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Teacher_page(widget.toString()),
        ),
      );
    }
  }

  File? _image;
  Future cameraImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future galleryImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae2b7),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "${widget} Account",
            style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          //reverse: true,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: _image == null ? Text("") : Image.file(_image!),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      cameraImage();
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  new FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      galleryImage();
                    },
                    child: Icon(
                      Icons.photo_library_outlined,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  decoration: InputDecoration(hintText: "First Name *"),
                  onChanged: (input) {
                    setState(() {
                      _fname = input;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Last Name *"),
                  onChanged: (input) {
                    setState(() {
                      _lname = input;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  children: [
                    Text('Gender:', style: TextStyle(fontSize: 18, color: Colors.black54),),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                    ),
                    DropdownButton(
                      dropdownColor: Colors.white,
                      hint: Text("Select Gender *"),
                      value: genderchoose,
                      onChanged: (newValue) {
                        setState(() {
                          genderchoose = newValue;
                        });
                      },
                      items: genderitem.map((valueitem) {
                        return DropdownMenuItem(
                            value: valueitem, child: Text(valueitem));
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Teacher ID *"),
                  onChanged: (input) {
                    setState(() {
                      _t_id = input;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(hintText: "Present Address *"),
                  onChanged: (input) {
                    setState(() {
                      _add = input;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: "Contact No. *"),
                  onChanged: (input) {
                    setState(() {
                      _t_num = input;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              // ignore: deprecated_member_use
              FlatButton(
                color: Colors.orange,
                minWidth: MediaQuery.of(context).size.width * 0.4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  sendDataTeacher();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Teacher_page("false"),
                      ),
                      (route) => false);
                  print(auth.tenantId);

                  if (_image == null) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Please Pick Your Image'),
                          );
                        });
                  } else if (_fname == null) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Please Enter your First Name'),
                          );
                        });
                  } else if (_lname == null) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Please Enter Your Last Name'),
                          );
                        });
                  } else if (genderchoose == null) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Please Enter Your Gender'),
                          );
                        });
                  } else if (_t_id == null) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Please Enter Your ID'),
                          );
                        });
                  } else if (_add == null) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Please Enter Your Present Address'),
                          );
                        });
                  } else if (_t_num == null || _t_num.length != 11) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Please Enter Your Contact Number'),
                          );
                        });
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
