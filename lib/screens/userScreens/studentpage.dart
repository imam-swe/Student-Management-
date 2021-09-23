import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_school/screens/drawerScreens/header_drawer.dart';

// ignore: must_be_immutable
class Student_page extends StatefulWidget {
  String? status;
  Student_page(String? status) {
    this.status = status;
  }
  @override
  _Student_pageState createState() => _Student_pageState(status);
}

class _Student_pageState extends State<Student_page> {
  String? status;
  _Student_pageState(String? status) {
    this.status = status;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Student Portal")),
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
          body: _build_Body(status)),
    );
  }

  Widget _build_Body(String? status) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
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
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
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
