import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({Key? key}) : super(key: key);

  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  String? status;

  final FirebaseAuth auth = FirebaseAuth.instance;

  String? _fname, _lname, _email, _gender, _image, _address, _phone, _t_id;

  // CollectionReference collectionReference =
  //     FirebaseFirestore.instance.collection('i-student');
  // dynamic data;
  getProfile() async {
    final collection = FirebaseFirestore.instance.collection('i-teacher');
    await collection.doc(auth.currentUser!.uid).get().then((value) {
      this._image = value["Image"];
      this._fname = value["First_Name"];
      this._lname = value["Last_Name"];
      this._email = value["E-Mail"];
      this._address = value["Address"];
      this._phone = value["Contact_Number"];
      this._gender = value["Gender"];
      //this._g_name = value["Guardian_Name"];
      this._t_id = value["Teacher ID"];
      //TextEditingController _cntFname =TextEditingController(text: fName.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0535f),
      appBar: AppBar(
        title: Text("Profile Information"),
        centerTitle: true,
      ),
      body: _build_ShowProfile(),
    );
  }

  Widget _build_ShowProfile() {
    //getProfile();
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: getProfile(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(_image.toString()),
                    ),
                    // Center(
                    //     child: Text(
                    //   'Your profile',
                    //   style:
                    //       TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    // ),
                    // ),
                    DataTable(
                      columns: [
//              DataColumn(label: Text(
//                  'ID',
//                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//              )),
                        DataColumn(
                            label: Text(
                          'Name:',
                          //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                        )),
                        DataColumn(
                            label: Text(
                          _fname.toString() + ' ' + _lname.toString(),
                          //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                        )),
                      ],
                      rows: [
//                         DataRow(cells: [
// //                DataCell(Text('15')),
//                           DataCell(Text('profile pic')),
//                           DataCell(
//                             CircleAvatar(
//                               backgroundImage: AssetImage("images/gunjon.png"),
//                               radius: 30,
//                               //child: Text("Profile"),
//                             ),
//                           ),
//                         ]),
                        DataRow(cells: [
//                DataCell(Text('1')),
                          DataCell(Text("Email:")),
                          DataCell(Text(_email.toString())),
                        ]),
                        DataRow(cells: [
//                DataCell(Text('5')),
                          DataCell(Text("Gender:")),
                          DataCell(Text(_gender.toString())),
                        ]),
                        DataRow(cells: [
//                DataCell(Text('10')),
                          DataCell(Text('Teacher ID:')),
                          DataCell(Text(_t_id.toString())),
                        ]),
                        DataRow(cells: [
//                DataCell(Text('15')),
                          DataCell(Text('Address:')),
                          DataCell(Text(_address.toString())),
                        ]),
                        DataRow(cells: [
//                DataCell(Text('15')),
                          DataCell(Text('Phone Number:')),
                          DataCell(Text(_phone.toString())),
                        ]),
                      ],
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
