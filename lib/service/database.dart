import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseFunctions {
  Future<void> uploadUserInfo(userMap) async {
    FirebaseFirestore.instance.collection("Users").add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  getUserInfo(String email) async {
    return FirebaseFirestore.instance
      .collection('Users')
      .where('email', isEqualTo: email)
      .get();
  }
}