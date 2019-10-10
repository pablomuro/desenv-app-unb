import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meau/models/BaseModel.dart';
import 'dart:convert';

class Notification extends BaseModel{
  Notification();

  String documentID;
  String name;
  String email;
  String state;

  
  Notification.fromMap(DocumentSnapshot document) {
    documentID = document.documentID;

    this.name = document.data['name'];
    this.email = document.data['email'];
    this.state = document.data['state'];
    
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();

    map['name'] = this.name;
    map['email'] = this.email;
    map['state'] = this.state;

    return map;
  }

  @override
  String documentId() => documentID;
}