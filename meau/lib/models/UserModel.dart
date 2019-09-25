import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:meau/models/BaseModel.dart';
import 'dart:convert';

class User extends BaseModel{
  String _documentId;
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
  
  User.fromMap(DocumentSnapshot document) {
    _documentId = document.documentID;

    this.name = document.data['name'];
    this.age = document.data['age'];
    this.email = document.data['email'];
    this.state = document.data['state'];
    this.city = document.data['city'];
    this.adrress = document.data['adrress'];
    this.phone = document.data['phone'];
    this.username = document.data['username'];
    this.password = document.data['password'];
    // this.confirmPassword = document.data['confirmPassword'];
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
    map['confirmPassword'] = this.confirmPassword;
    map['pictureString'] = this.pictureString;

    return map;
  }

  @override
  String documentId() => _documentId;
}