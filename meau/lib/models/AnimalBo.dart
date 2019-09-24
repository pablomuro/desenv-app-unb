import 'package:cloud_firestore/cloud_firestore.dart';

enum AnimalType{
  DOG,
  CAT
}

class Animal{
  String id;
  AnimalType type;
  String name;
  int age;
  String email;
  String state;
  String city;
  String adrress;
  String phone;
  String username;
  String password;
  String confirmPassword;
  String picture;
}