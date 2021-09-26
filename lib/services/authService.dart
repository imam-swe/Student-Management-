import '../users/userDetection.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future createUserWithEmailAndPassword(String userName, String email,
      String passWord, String phoneNo, bool users) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: passWord);
//      final user = _firebaseAuth.currentUser!;
//      user.updateDisplayName(userName.toString());
    //user.updatePhoneNumber();
    print("added");
    if (credential.user != null) {
      if (users == false) {
        _firebaseAuth.currentUser!.updateDisplayName(userName.toString());
        // _firebaseAuth.currentUser!.updatePhoneNumber(int.parse(phoneNo));
        await _firestore
            .collection('student user')
            .doc(_firebaseAuth.currentUser!.uid)
            .set({
          "Name": userName,
          "Email": email,
          "phoneNumber": phoneNo,
          "status": "Unavialable",
          "uid": _firebaseAuth.currentUser!.uid,
        });
      } else {
        _firebaseAuth.currentUser!.updateDisplayName(userName.toString());
        await _firestore
            .collection('teacher user')
            .doc(_firebaseAuth.currentUser!.uid)
            .set({
          "Name": userName,
          "Email": email,
          "phoneNumber": phoneNo,
          "status": "Unavialable",
          "uid": _firebaseAuth.currentUser!.uid,
        });
      }
//      _firebaseAuth.currentUser!.updateDisplayName(userName.toString());
//      await _firestore
//          .collection('student user')
//          .doc(_firebaseAuth.currentUser!.uid)
//          .set({
//        "Name":userName,
//        "Email": email,
//        "phoneNumber":phoneNo,
//        "status":"Unavialable",
//        "uid":_firebaseAuth.currentUser!.uid,
//      });
    }
  }

  Future signInWithEmailAndPassword(String email, String passWord) async {
    final credetial = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: passWord);
  }

//  User? _userFromFirebase(auth.User? user) {
//    if (user == null) {
//      return null;
//    }
//    return User(user.uid, user.email);
//  }
}
