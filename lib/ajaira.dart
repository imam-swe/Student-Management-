import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:login_registration_app/sing_in_page.dart';
// import 'package:flutter/scheduler.dart';

class ChatRoom extends StatefulWidget {
  // const ChatRoom({Key? key}) : super(key: key);
  static const String id = "chatroom";
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _chat = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String messageText;
  late User loggedInUser;
  final messageTextController = TextEditingController();

  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(user.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Room"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (context) => LoginScreen()),
              //     (route) => false);
            },
          )
        ],
      ),
      backgroundColor: Color(0xffD4F1F4),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('messages')
                      .orderBy('messageTime', descending: true)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Text("no data");
                    } else
                      return ListView(
                        reverse: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: snapshot.data!.docs.map(
                          (DocumentSnapshot documents) {
                            Map<String, dynamic> data =
                                documents.data()! as Map<String, dynamic>;
                            return Column(
                              crossAxisAlignment:
                                  loggedInUser.email == data['Email']
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: loggedInUser.email == data['Email']
                                        ? Colors.blueGrey.withOpacity(0.2)
                                        : Colors.amberAccent.withOpacity(0.4),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            loggedInUser.email == data['Email']
                                                ? CrossAxisAlignment.end
                                                : CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['text'] ?? "",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                          Text(
                                            loggedInUser.email.toString(),
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          },
                        ).toList(),
                      );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Write your Message',
                        ),
                        controller: _chat,
                        onChanged: (value) {
                          messageText = value;
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _firestore.collection('messages').add(
                          {
                            'messageTime': DateTime.now(),
                            'text': messageText,
                            'Email': loggedInUser.email,
                          },
                        );
                        _chat.clear();
                      },
                      icon: Icon(Icons.send),
                    ),
                    
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
