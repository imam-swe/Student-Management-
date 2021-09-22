// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class Student_page extends StatefulWidget {
//   String? status;
//   Student_page(String? status) {
//     this.status = status;
//   }
//   @override
//   _Student_pageState createState() => _Student_pageState(status);
// }

// class _Student_pageState extends State<Student_page> {
//   String? status;
//   _Student_pageState(String? status) {
//     this.status = status;
//   }


//   bool _isEnable = false;

//   String? name,email,phoneN,statusU,uId,fName,mName,perAdd,preAdd;

//   getProfile()async{

//     try{
//       print(this.fName.toString()+"...........ok.............");

//     }catch(e){
//         print(e);
//       }
//     }
//     @override
// //  void initState() {
// // ignore: todo
// //    // TODO: implement initState
// //    super.initState();
// //    //getProfile();
// //  }
//   //_cntFname = TextEditingController(text: fName);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//           appBar: AppBar(
//             title: Center(child: Text("Student Portal")),
//           ),
//           //drawer: Drawerneg(),
//           body: _build_Body(status)),
//     );
//   }

//   Widget _build_Body(String? status) {
//     return SingleChildScrollView(
//       child: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (status == "p") ...[
//               _build_ShowProfile()
//             ] else if (status == "r") ...[
//               _build_ShowResult()
//             ] else if (status == "cr") ...[
//               _build_ChatRoom()
//             ] else if (status == "ocr") ...[
//               _build_OnlineClassRoom()
//             ] else if (status == "nb") ...[
//               _build_NoticeBoard()
//             ] else if (status == "cr") ...[
//               _build_ChatRoom()
//             ] else if (status == "hw") ...[
//               _build_HomeWork()
//             ] else if (status == "a") ...[
//               _build_Assignment()
//             ] else if (status == "up") ...[
//               _build_UpdateProfile()
//             ]
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _build_ShowProfile() {
//     //getProfile();
//     return SingleChildScrollView(
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.white,
//         child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: FutureBuilder(
//               future: getProfile(),
//               builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {


//                return Column(
//                 children: [
//                   Center(
//                       child: Text(
//                     'Your profile',
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                   )),
//                   DataTable(
//                     columns: [
// //              DataColumn(label: Text(
// //                  'ID',
// //                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
// //              )),
//                       DataColumn(
//                           label: Text(
//                         'Name',
//                         //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//                       )),
//                       DataColumn(
//                           label: Text(
//                         name.toString(),
//                         //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//                       )),
//                     ],
//                     rows: [
//                       DataRow(cells: [
// //                DataCell(Text('15')),
//                         DataCell(Text('profile pic')),
//                         DataCell(
//                           CircleAvatar(
//                             backgroundImage: AssetImage("images/gunjon.png"),
//                             radius: 30,
//                             //child: Text("Profile"),
//                           ),
//                         ),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('1')),
//                         DataCell(Text("father's Name")),
//                         DataCell(Text(fName.toString())),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('5')),
//                         DataCell(Text("Mother's Name")),
//                         DataCell(Text(mName.toString())),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('10')),
//                         DataCell(Text('Permanent Address')),
//                         DataCell(Text(perAdd.toString())),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('15')),
//                         DataCell(Text('present address')),
//                         DataCell(Text(preAdd.toString())),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('15')),
//                         DataCell(Text('Phone No')),
//                         DataCell(Text(phoneN.toString())),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('15')),
//                         DataCell(Text('Email')),
//                         DataCell(Text(email.toString())),
//                       ]),
//                     ],
//                   ),
//                 ],
//               );
//   },
//             )),
//       ),
//     );
//   }

//   Widget _build_ShowResult() {
//     return Container();
//   }



//   Widget _build_OnlineClassRoom() {
//     return Container();
//   }

//   Widget _build_NoticeBoard() {
//     return Container();
//   }

//   Widget _build_ChatRoom() {
//     return Container();
//   }

//   Widget _build_HomeWork() {
//     return Container();
//   }

//   Widget _build_Assignment() {
//     return Container();
//   }

//   Widget _build_UpdateProfile() {
//     getProfile();
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       color: Colors.white,
//       child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView(children: <Widget>[
//                   Center(
//                       child: Text(
//                     'Edit profile',
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                   )),
//                   DataTable(
//                     columns: [
// //              DataColumn(label: Text(
// //                  'ID',
// //                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
// //              )),
//                       DataColumn(
//                           label: Text(
//                         'Name',
//                         //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//                       )),
//                       DataColumn(
//                           label: Row(
//                         children: <Widget>[
//                           Container(
//                             width: 100,
//                             child: TextField(
//                               controller: _cntName,
//                               //enabled: true,//_isEnable,
//                               decoration: InputDecoration(
//                                 labelText: "$name"//name.toString()//_firebaseAuth.currentUser!.displayName.toString()
//                               ),
//                             ),
//                           ),
// //                          IconButton(
// //                              icon: Icon(Icons.edit),
// //                              onPressed: () {
// //                                setState(() {
// //                                  _isEnable = true;
// //                                });
// //                              })
//                         ],
//                       )),
//                     ],
//                     rows: [
//                       DataRow(cells: [
// //                DataCell(Text('15')),
//                         DataCell(Text('profile pic')),
//                         DataCell(
//                           CircleAvatar(
//                             backgroundImage: AssetImage("images/gunjon.png"),
//                             radius: 30,
//                             //child: Text("Profile"),
//                           ),
//                         ),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('1')),
//                         DataCell(Text("father's Name")),
//                         DataCell(
//                           Row(
//                             children: <Widget>[
//                               Container(
//                                 width: 100,
//                                 child: TextField(
//                                   controller: _cntFname,
//                                   enabled: _isEnable,
//                                   decoration: InputDecoration(
//                                     hintText: fName.toString(),
//                                   ),
//                                 ),
//                               ),
//                               IconButton(
//                                   icon: Icon(Icons.edit),
//                                   onPressed: () {
//                                     setState(() {
//                                       _isEnable = true;
//                                     });
//                                   })
//                             ],
//                           ),
//                         ),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('5')),
//                         DataCell(Text("Mother's Name")),
//                         DataCell(Row(
//                           children: <Widget>[
//                             Container(
//                               width: 100,
//                               child: TextField(
//                                 controller: _cntMname,
//                                 //enabled: _isEnable,
//                                 decoration: InputDecoration(
//                                   hintText: mName.toString()
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                                 icon: Icon(Icons.edit),
//                                 onPressed: () {
//                                   setState(() {
//                                     _isEnable = true;
//                                   });
//                                 })
//                           ],
//                         )),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('10')),
//                         DataCell(Text('Permanent Address')),
//                         DataCell(Row(
//                           children: <Widget>[
//                             Container(
//                               width: 100,
//                               child: TextField(
//                                 controller: _cntPerAdd,
//                                 //enabled: _isEnable,
//                                 decoration: InputDecoration(
//                                   hintText: perAdd.toString()
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                                 icon: Icon(Icons.edit),
//                                 onPressed: () {
//                                   setState(() {
//                                     _isEnable = true;
//                                   });
//                                 })
//                           ],
//                         )),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('15')),
//                         DataCell(Text('present address')),
//                         DataCell(Row(
//                           children: <Widget>[
//                             Container(
//                               width: 100,
//                               child: TextField(
//                                 controller: _cntPreAdd,
//                                 //enabled: _isEnable,
//                                 decoration: InputDecoration(
//                                   hintText: preAdd.toString()
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                                 icon: Icon(Icons.edit),
//                                 onPressed: () {
//                                   setState(() {
//                                     _isEnable = true;
//                                   });
//                                 })
//                           ],
//                         )),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('15')),
//                         DataCell(Text('Phone No')),
//                         DataCell(Row(
//                           children: <Widget>[
//                             Container(
//                               width: 100,
//                               child: TextField(
//                                 controller: _cntPhone,
//                                 //enabled: _isEnable,
//                                 decoration: InputDecoration(
//                                   hintText: phoneN.toString()
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                                 icon: Icon(Icons.edit),
//                                 onPressed: () {
//                                   setState(() {
//                                     _isEnable = true;
//                                   });
//                                 })
//                           ],
//                         )),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('15')),
//                         DataCell(Text('Email')),
//                         DataCell(Row(
//                           children: <Widget>[
//                             Container(
//                               width: 100,
//                               child: TextField(
//                                 controller: _cntEmail,
//                                 //enabled: false,//_isEnable,
//                                 decoration: InputDecoration(
//                                   hintText: email.toString()
//                                 ),
//                               ),
//                             ),
// //                            IconButton(
// //                                icon: Icon(Icons.edit),
// //                                onPressed: () {
// //                                  setState(() {
// //                                    _isEnable = true;
// //                                  });
// //                                })
//                           ],
//                         )),
//                       ]),
//                       DataRow(cells: [
// //                DataCell(Text('15')),
//                         DataCell(Text("")),
//                         DataCell(Padding(
//                           padding: const EdgeInsets.only(top: 8),
//                           child: ElevatedButton.icon(
//                               onPressed: () async {
                                
//                               },
//                               icon: Icon(Icons.send_and_archive_outlined),
//                               label: Text(
//                                 "Submit",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                 ),
//                               )),
//                         )),
//                       ])
//                     ],
//                   ),
//                 ]),
//               ),
//             ],
//           )),
//     );
//   }
// }

