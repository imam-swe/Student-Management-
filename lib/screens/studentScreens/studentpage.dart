import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_school/messages/chat_room_all.dart';
import 'package:i_school/screens/homepage.dart';
import 'package:i_school/screens/studentScreens/drawer_st.dart';
import 'package:i_school/screens/studentScreens/student_profile.dart';

// ignore: must_be_immutable
class Student_page extends StatefulWidget {
  String? status;

  // Student_page(String? status) {
  //   this.status = status;
  // }
  String email;

  Student_page(this.email);
  @override
  _Student_pageState createState() => _Student_pageState(status);
}

class _Student_pageState extends State<Student_page> {
  String? status;

  _Student_pageState(String? status) {
    this.status = status;
  }
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: StreamBuilder(
              stream: firestore
                  .collection("Test")
                  .orderBy('Notice Time')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Text("No Data");
                }
                return ListView(
                  reverse: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.only(top: 24),
                  children: snapshot.data!.docs.map((document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Column(
                      children: [
                        // Text(data["Notice"].toString()),
                        // SizedBox(
                        //   height: 20,
                        // )
                        Container(
                          width: MediaQuery.of(context).size.width*.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber.shade300.withOpacity(0.4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //     widget.email == data['Email']
                              //         ? CrossAxisAlignment.end
                              //         : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['Notice Title'] ?? "",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  data['Notice Details'] ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Date:' +
                                      data['Notice Time']
                                          .toString()
                                          .substring(0, 19),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),

        // body: _build_Body(),
      ),
    );
  }

  // Widget _build_Body() {
  //   return SingleChildScrollView(
  //     child: Container(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             margin: EdgeInsets.all(20),
  //             child: Table(
  //               defaultColumnWidth: FixedColumnWidth(120.0),
  //               border: TableBorder.all(
  //                   color: Colors.black, style: BorderStyle.solid, width: 2),
  //               children: [
  //                 TableRow(children: [
  //                   Column(children: [
  //                     Text('Time', style: TextStyle(fontSize: 20.0))
  //                   ]),
  //                   Column(children: [
  //                     Text('Class', style: TextStyle(fontSize: 20.0))
  //                   ]),
  //                   Column(children: [
  //                     Text('Section', style: TextStyle(fontSize: 20.0))
  //                   ]),
  //                 ]),
  //                 TableRow(children: [
  //                   Column(children: [Text('09.00am-11.00am')]),
  //                   Column(children: [Text('Flutter Basic')]),
  //                   Column(children: [Text('Section: A')]),
  //                 ]),
  //                 TableRow(children: [
  //                   Column(children: [Text('12.00pm-01.00pm')]),
  //                   Column(children: [Text('Fluter Firebase')]),
  //                   Column(children: [Text('Section: B')]),
  //                 ]),
  //                 TableRow(children: [
  //                   Column(children: [Text('02.00pm-04.00pm')]),
  //                   Column(children: [Text('Fluter API')]),
  //                   Column(children: [Text('Section: C')]),
  //                 ]),
  //               ],
  //             ),
  //           ),
  //           SizedBox(
  //             height: 20.0,
  //           ),
  //           //Show notice board
  //           // Container(
  //           //   child: Center(
  //           //     child: StreamBuilder(
  //           //       stream: FirebaseFirestore.instance
  //           //           .collection("Test")
  //           //           //.orderBy(timeDilation)
  //           //           .snapshots(),
  //           //       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //           //         if (!snapshot.hasData) {
  //           //           return Text("No Data");
  //           //         }
  //           //         return ListView(
  //           //           // scrollDirection: Axis.vertical,
  //           //           // physics: ScrollPhysics(),
  //           //           // padding: EdgeInsets.only(top: 24),
  //           //           children: snapshot.data!.docs.map((document) {
  //           //             Map<String, dynamic> data =
  //           //                 document.data()! as Map<String, dynamic>;
  //           //             return Column(
  //           //               children: [
  //           //                 Text(data["Notice"].toString()),
  //           //               ],
  //           //             );
  //           //           }).toList(),
  //           //         );
  //           //       },
  //           //     ),
  //           //   ),
  //           // ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
            title: const Text('     Home'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Student_page("true")),
                  (route) => false);
            },
          ),
          ListTile(
            title: const Text('     Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentProfile()));
            },
          ),
          ListTile(
            title: const Text('     Result'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('     Routine'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('     Notice'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('     Messaging'),
            onTap: () {
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (context) => ChatRoomAll()),
              //     (route) => false);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatRoomAll()));
            },
          ),
          ListTile(
            title: const Text('     Live Class'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          // ListTile(
          //   title: const Text('Class Recording'),
          //   onTap: () {
          //     // Update the state of the app.
          //     // ...
          //   },
          // ),
          ListTile(
            title: const Text('     Logout'),
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
