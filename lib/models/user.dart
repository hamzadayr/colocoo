import 'package:cloud_firestore/cloud_firestore.dart';
class User{
  String uid;
  String email;
  String name;
  String phone;
  Timestamp accountCreated;
  User({
    this.uid,
    this.email,
    this.name,
    this.phone,
    this.accountCreated,
  });
}