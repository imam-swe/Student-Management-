// ignore_for_file: deprecated_member_use
import 'package:i_school/messages/chat_room_all.dart';
import 'package:i_school/screens/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:i_school/screens/teacherScreens/drawer_tr.dart';
import 'package:i_school/screens/teacherScreens/teacher_profile.dart';

class Teacher_page extends StatefulWidget {
  const Teacher_page(String string, {Key? key}) : super(key: key);

  @override
  _Teacher_pageState createState() => _Teacher_pageState();
}

class _Teacher_pageState extends State<Teacher_page> {
  //late String notice;
  TextEditingController noticecontroller = TextEditingController();
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

        // body: Center(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Expanded(
        //         child: TextField(
        //           controller: noticecontroller,
        //           decoration: InputDecoration(
        //             labelText: 'Add a Notice',
        //             icon: const Padding(
        //               padding: const EdgeInsets.only(top: 15.0),
        //               child: const Icon(Icons.notification_add),
        //             ),
        //           ),
        //           keyboardType: TextInputType.multiline,
        //           maxLines: null,
        //           // onChanged: (input) {
        //           //   setState(
        //           //     () {
        //           //       notice = input;
        //           //     },
        //           //   );
        //           // },
        //         ),
        //       ),
        //       IconButton(
        //         onPressed: () {
        //           firestore.collection('Test').add(
        //             {
        //               'NoticeTime': DateTime.now().toString(),
        //               'Notice': noticecontroller.text,
        //               //'Email': loggedInUser.email,
        //             },
        //           );
        //           noticecontroller.clear();
        //         },
        //         icon: Icon(Icons.send),
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //     ],
        //   ),
        // ),

        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: const Text("Result")),
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.5),
                    child: Center(
                      //child: const Text('Notice'),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.notification_add),
                          Expanded(
                            child: TextField(
                              controller: noticecontroller,
                              decoration: InputDecoration(
                                labelText: 'Add a Notice',
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              // onChanged: (input) {
                              //   setState(
                              //     () {
                              //       notice = input;
                              //     },
                              //   );
                              // },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              firestore.collection('Test').add(
                                {
                                  'NoticeTime': DateTime.now().toString(),
                                  'Notice': noticecontroller.text,
                                },
                              );
                              noticecontroller.clear();
                            },
                            icon: Icon(Icons.send),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.yellow[100],
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: const Text('Class Routine')),
                    decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: const Text('Who scream')),
                    decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: const Text('Revolution is coming...')),
                    decoration: BoxDecoration(
                        color: Colors.green[500],
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: const Text('Revolution, they...')),
                    decoration: BoxDecoration(
                        color: Colors.green[600],
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              ),
            ),
          ],
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
            title: const Text('Home'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Teacher_page("false")),
                  (route) => false);
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TeacherProfile()));
            },
          ),
          ListTile(
            title: const Text('Notice Board'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Notice'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Message'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatRoomAll()));
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyHomePage(title: 'Student Management System')),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
