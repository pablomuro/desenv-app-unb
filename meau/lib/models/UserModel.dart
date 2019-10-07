import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:meau/models/BaseModel.dart';
import 'dart:convert';

class User extends BaseModel{
  User();

  String documentID;
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
  String pictureString;
  Image pictureParsed;
  List<DocumentSnapshot> pets;
  
  User.fromMap(DocumentSnapshot document) {
    documentID = document.documentID;

    this.name = document.data['name'];
    this.age = document.data['age'];
    this.email = document.data['email'];
    this.state = document.data['state'];
    this.city = document.data['city'];
    this.adrress = document.data['adrress'];
    this.phone = document.data['phone'];
    this.username = document.data['username'];
    this.password = document.data['password'];
    this.pets = document.data['pets'];
    this.pictureString = document.data['pictureString'];
    Uint8List bytes = base64.decode(this.pictureString);
    this.pictureParsed = Image.memory(bytes);
    
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();

    map['name'] = this.name;
    map['age'] = this.age;
    map['email'] = this.email;
    map['state'] = this.state;
    map['city'] = this.city;
    map['adrress'] = this.adrress;
    map['phone'] = this.phone;
    map['username'] = this.username;
    map['password'] = this.password;
    map['pets'] = this.pets;
    map['pictureString'] = this.pictureString;

    return map;
  }

  @override
  String documentId() => documentID;
}