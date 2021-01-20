import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices{

  final String uid;
  DatabaseServices({this.uid});

  final CollectionReference qrCollection = FirebaseFirestore.instance.collection('QRCreate');

  Future updateUserData(String username, int gender, String email, DateTime dob, String mobileno, String password) async {
    return await qrCollection.doc(uid).set({
      'username' : username,
      'gender' : gender,
      'email' : email,
      'dob' : dob,
      'mobileno' : mobileno,
      'password' : password,
    });
  }
}