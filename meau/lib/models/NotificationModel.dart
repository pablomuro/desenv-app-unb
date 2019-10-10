import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meau/models/BaseModel.dart';

class Notification extends BaseModel{
  Notification();

  String documentID;
  String userTo;
  String userFrom;
  String pet;
  NotificationType type;
  String seen;
  NotificationResponse response;

  
  Notification.fromMap(DocumentSnapshot document) {
    documentID = document.documentID;

    this.userTo = document.data['userTo'];
    this.userFrom = document.data['userFrom'];
    this.pet = document.data['pet'];
    this.type = document.data['type'];
    this.seen = document.data['seen'];
    this.response = document.data['response'];


    // FRk9XVbbYSt2O2PfJZGA    - teste

    // YSYIeX58agIJDtHS1TYc  -- pablo
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();

    map['userTo'] = this.userTo;
    map['userFrom'] = this.userFrom;
    map['pet'] = this.pet;
    map['type'] = this.type;
    map['seen'] = this.seen;
    map['response'] = this.response;

    return map;
  }

  @override
  String documentId() => documentID;
}

enum NotificationType{
  Request,
  Response
}

enum NotificationResponse{
  Accept,
  Deny
}