import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNotice extends StatefulWidget {
  const AddNotice({Key? key}) : super(key: key);

  @override
  _AddNoticeState createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {
  TextEditingController noticetitle = TextEditingController();
  TextEditingController noticedetails = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    // var noticetitle;
    // var noticedetails;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Notice")),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notice Title:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextField(
                  maxLength: 60,
                  controller: noticetitle,
                  decoration: InputDecoration(
                    hintText: 'Notice Title',
                    // icon: const Padding(
                    //   padding: const EdgeInsets.only(top: 15.0),
                    //   child: const Icon(Icons.notification_add),
                    // ),
                  ),
                  keyboardType: TextInputType.text,
                  maxLines: null,
                ),
              ),
              Text(
                'Notice Description:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                //minLines: 3,
                controller: noticedetails,
                decoration: InputDecoration(
                  hintText: 'Notice Details',
                  //labelText: 'Notice Details',
                  // icon: const Padding(
                  //   padding: const EdgeInsets.only(top: 15.0),
                  //   child: const Icon(Icons.notification_add),
                  // ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    firestore.collection('Test').add(
                      {
                        'Notice Time': DateTime.now().toString(),
                        'Notice Title': noticetitle.text,
                        'Notice Details': noticedetails.text,
                        //'Email': loggedInUser.email,
                      },
                    );
                    noticetitle.clear();
                    noticedetails.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text('Post Notice'),
                ),
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.green[100],
              //   ),
              //   child: Text("Hang Notice"),
              //   onPressed: () {
              //     firestore.collection('Test').add(
              //       {
              //         'NoticeTime': DateTime.now().toString(),
              //         'Notice': noticecontroller.text,
              //         //'Email': loggedInUser.email,
              //       },
              //     );
              //     noticecontroller.clear();
              //   },
              // ),
              // IconButton(
              //   onPressed: () {
              //     firestore.collection('Test').add(
              //       {
              //         'NoticeTime': DateTime.now().toString(),
              //         'Notice': noticecontroller.text,
              //         //'Email': loggedInUser.email,
              //       },
              //     );
              //     noticecontroller.clear();
              //   },
              //   icon: Icon(Icons.send),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
