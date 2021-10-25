



//ajaira


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AddNotice extends StatefulWidget {
//   const AddNotice({Key? key}) : super(key: key);

//   @override
//   _AddNoticeState createState() => _AddNoticeState();
// }

// class _AddNoticeState extends State<AddNotice> {
//   TextEditingController noticecontroller = TextEditingController();
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     var noticecontroller;
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("Add Notice")),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(0.5),
//         child: Center(
//           //child: const Text('Notice'),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.notification_add),
//               Expanded(
//                 child: TextField(
//                   controller: noticecontroller,
//                   decoration: InputDecoration(
//                     labelText: 'Add a Notice',
//                   ),
//                   keyboardType: TextInputType.multiline,
//                   maxLines: null,
//                   // onChanged: (input) {
//                   //   setState(
//                   //     () {
//                   //       notice = input;
//                   //     },
//                   //   );
//                   // },
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   firestore.collection('Test').add(
//                     {
//                       'NoticeTime': DateTime.now().toString(),
//                       'Notice': noticecontroller.text,
//                     },
//                   );
//                   noticecontroller.clear();
//                 },
//                 icon: Icon(Icons.send),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//         decoration: BoxDecoration(
//             color: Colors.yellow[100], borderRadius: BorderRadius.circular(8)),
//       ),
//     );
//   }
// }
