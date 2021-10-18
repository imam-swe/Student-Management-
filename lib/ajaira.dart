// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// // DocumentSnapshot? snapshot;
// String firstName = 'loading...';
// String lastName = 'loading...';
// String imageurl = 'loading...';
// String title = 'loading...'; //Define snapshot

// class MyHeaderDrawer extends StatefulWidget {
//   @override
//   _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
// }

// class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
//   // Stream<DocumentSnapshot> sNapshot1= FirebaseFirestore.instance.collection('i-student').doc(firebaseUser.uid).snapshots();
//   // String? imageurl;
  


//   //Creating a reference to the collection 'users'
//   CollectionReference collectionReference =
//     FirebaseFirestore.instance.collection('i-student');

//   //This function will set the values to firstName, lastName and title from the data fetched from firestore 
//   void getUsersData() {
//     collectionReference.doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {

//       //'value' is the instance of 'DocumentSnapshot'
//       //'value.data()' contains all the data inside a document in the form of 'dictionary'
//       var fields = value.data();
      
//       //Using 'setState' to update the user's data inside the app
//       //firstName, lastName and title are 'initialised variables'
//       setState(() {
//         firstName = fields!['First_Name'];
//         lastName = fields['Last_Name'];
//         title = fields['E-Mail'];
//       });
//     });
//   }



//   // dynamic data;
//   // _fetch() async {
//   //   final data = await FirebaseFirestore.instance
//   //       .collection("i-student")
//   //       .doc(FirebaseAuth.instance.currentUser!.uid)
//   //       .get(); //get the data
//   //   snapshot = data;
//   // }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _fetch();
//   //   //print(data['Image'].toString());
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.orange[800],
//       width: double.infinity,
//       height: 220,
//       padding: EdgeInsets.only(top: 20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.only(bottom: 10),
//             height: 150,
//             // decoration: BoxDecoration(
//             //   shape: BoxShape.circle,
//             //   image: DecorationImage(
//             //     image: AssetImage('images/smsst.png'),
//             //   ),
//             // ),
            
//             // child: FutureBuilder(
//             //   future: _fetch(),
//             //   builder: (context, snapshot) {
//             //     if (snapshot.connectionState != ConnectionState.done)
//             //       return Text(
//             //         "",
//             //         style: TextStyle(color: Colors.white),
//             //       );
//             //     return Column(
//             //       children: [
//             //         CircleAvatar(
//             //           radius: 30.0,
//             //           backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/loginproj-7de66.appspot.com/o/data%2Fuser%2F0%2Fcom.excelitai.i_school%2Fcache%2Fc1017fc2-d518-445e-abd1-59489cc3df0f5970535765573203013.jpg?alt=media&token=5352419f-a5a7-419f-9e55-14d2708c5e9a"),
//             //         ),
//             //         //image would be dinamic.
//             //       ],
//             //     );
//             //   },
//             // ),

//             child: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection("i-student").snapshots(),
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (!snapshot.hasData) {
//                   return Text("Loading...");
//                 }
//                 return ListView(
//                   scrollDirection: Axis.vertical,
//                   physics: ScrollPhysics(),
//                   padding: EdgeInsets.only(top: 24),
//                   children: snapshot.data!.docs.map((document) {
//                     Map<String, dynamic> data =
//                         document.data()! as Map<String, dynamic>;
//                     return Column(
//                       children: [
//                         CircleAvatar(
//                           radius: 30.0,
//                           backgroundImage: NetworkImage(
//                               data["Image"].toString()),
//                         ),
//                         Text(
//                           data["First_Name"].toString(),
//                           style: TextStyle(color: Colors.black, fontSize: 20),
//                         ),
//                         Text(
//                           data["E-Mail"].toString(),
//                           style: TextStyle(
//                             color: Colors.black87,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     );
//                   }).toList(),
//                 );
//               },
//             ),
//           ),
//           // Text(
//           //   "Test1",
//           //   style: TextStyle(color: Colors.white, fontSize: 20),
//           // ),
//           // Text(
//           //   "info@test1.st",
//           //   style: TextStyle(
//           //     color: Colors.grey[200],
//           //     fontSize: 14,
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
