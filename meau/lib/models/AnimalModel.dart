import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meau/models/BaseModel.dart';
import 'dart:convert';

class Animal extends BaseModel{
  Animal();

  String documentID;
  HelpAs helpAs;
  String name;
  AnimalType type;
  AnimalSex sex;
  AnimalSize size;
  AnimalAge age;
  List<dynamic> temper;
  List<dynamic> health;
  List<dynamic> needs;
  String goals;
  String about;
  String owner;
  String animalPicture;
  File animalImage;

  Animal.fromMap(DocumentSnapshot document) {
    documentID = document.documentID;

    this.name = document.data['name'];
    this.helpAs = document.data['helpAs'];
    this.type = document.data['type'];
    this.sex = document.data['sex'];
    this.size = document.data['size'];
    this.age = document.data['age'];

    this.temper = document.data['temper'];
    this.health = document.data['health'];
    this.needs = document.data['needs'];
    this.temper = this.temper.cast<String>();
    this.health = this.health.cast<String>();
    this.needs = this.needs.cast<String>();

    this.goals = document.data['goals'];
    this.about = document.data['about'];
    this.owner = document.data['owner'];
    this.animalPicture = document.data['animalPicture'];
    Uint8List bytes = base64.decode(this.animalPicture);
    this.animalImage = File.fromRawPath(bytes);
    
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();

    map['name'] = this.name;
    map['helpAs'] = this.helpAs;
    map['type'] = this.type;
    map['sex'] = this.sex;
    map['size'] = this.size;
    map['age'] = this.age;
    map['temper'] = this.temper;
    map['health'] = this.health;
    map['needs'] = this.needs;
    map['goals'] = this.goals;
    map['about'] = this.about;
    map['owner'] = this.owner;
    map['animalPicture'] = this.animalPicture;

    return map;
  }

  @override
  String documentId() => documentID;

}

enum HelpAs{
  Adoption,
  Sponsor,
  Help
}

enum AnimalType{
  Dog,
  Cat
}

enum AnimalSex{
  Male,
  Female
}

enum AnimalSize{
  Small,
  Medium,
  Large
}

enum AnimalAge{
  Puppy,
  Adult,
  Elderly
}