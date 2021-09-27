// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_school/screens/teacherScreens/drawer_tr.dart';

class Teacher_page extends StatefulWidget {
  const Teacher_page(String string, {Key? key}) : super(key: key);

  @override
  _Teacher_pageState createState() => _Teacher_pageState();
}

class _Teacher_pageState extends State<Teacher_page> {
  late String notice;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Teacher Portal")),
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MyHeaderDrawer(),
                  MyDrawerList(),
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Notice',
                  icon: const Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: const Icon(Icons.notification_add),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (input) {
                  setState(
                    () {
                      notice = input;
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("post"),
                onPressed: () {
                  setState(() async {
                    firestore.collection('i-teacher').add(
                      {
                        'Notice': notice,
                      },
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          // const DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          //   child: Text('Drawer Header'),
          // ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}