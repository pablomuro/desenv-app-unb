import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meau/models/BaseModel.dart';
import 'dart:convert';

class Animal extends BaseModel{
  Animal(){
    this.temper = new List<String>();
    this.health = new List<String>();
    this.needs = new List<String>();
  }

  String documentID;
  HelpAs helpAs;
  String name;
  AnimalType type;
  AnimalSex sex;
  AnimalSize size;
  AnimalAge age;
  List<dynamic> temper = new List<String>();
  List<dynamic> health = new List<String>();
  List<dynamic> needs = new List<String>();
  String goals;
  String about;
  String owner;
  String animalPicture;
  Uint8List animalImage;

  Animal.fromMap(DocumentSnapshot document) {
    documentID = document.documentID;

    this.name = document.data['name'];
    this.helpAs = HelpAs.values[document.data['helpAs']];
    this.type = AnimalType.values[document.data['type']];
    this.sex = AnimalSex.values[document.data['sex']];
    this.size = AnimalSize.values[document.data['size']];
    this.age = AnimalAge.values[document.data['age']];

    this.temper = new List<String>.from(document.data['temper']);
    this.health = new List<String>.from(document.data['health']);
    this.needs = new List<String>.from(document.data['needs']);

    this.goals = document.data['goals'];
    this.about = document.data['about'];
    this.owner = document.data['owner'];
    this.animalPicture = document.data['animalPicture'];
    Uint8List bytes = base64.decode(this.animalPicture);
    this.animalImage = bytes;
    
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();

    map['name'] = this.name;
    map['helpAs'] = this.helpAs.index;
    map['type'] = this.type.index;
    map['sex'] = this.sex.index;
    map['size'] = this.size.index;
    map['age'] = this.age.index;
    map['temper'] = this.temper;
    map['health'] = this.health;
    map['needs'] = this.needs;
    map['goals'] = this.goals;
    map['about'] = this.about;
    map['owner'] = this.owner;
    map['animalPicture'] = base64.encode(this.animalImage);

    return map;
  }

  @override
  String documentId() => documentID;

}

class AnimalPropertiesLists{
  static List<String> temper = [
    'Brincalhão',
    'Timido',
    'Calmo',
    'Guarda',
    'Amoroso',
    'Preguiçoso',
  ];
  static List<String> health = [
    'Vacinado',
    'Vermifugado',
    'Castrado',
    'Doente',
  ];
  static List<String> needs = [
    'Termo de adoção',
    'Fotos da casa',
    'Visita prévia ao animal',
    'Acompanhamento pós adoção',
  ];
}

enum HelpAs{
  None,
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