import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/services/AuthService.dart';


class UserService{
  CollectionReference _collection = Firestore.instance.collection('users');
  static AuthService _auth;
  static User currentUser;
  

  static final UserService instance = UserService._internal();

  factory UserService() {
    _auth = AuthService.instance;
    return instance;
  }

  UserService._internal();

  Stream<User> findById(String _documentId)  => _collection.where('_documentId', isEqualTo: _documentId).limit(1).snapshots().map(
    (query) => User.fromMap(query.documents[0])
  );
  Stream<User> findByEmail(String email)  => _collection.where('email', isEqualTo: email).limit(1).snapshots().map(
    (query) => User.fromMap(query.documents[0])
  );

  Stream<bool> emailAlreadyRegister(String email) => _collection.where('email', isEqualTo: email).limit(1).snapshots().map(
    (query) =>  (query.documents.length > 0) ? true : false
  );

  Future<bool> add(User user) async {
      bool result = await emailAlreadyRegister(user.email).first;
      if(result == true){
        var firebaseUser = await _auth.createUser(email: user.email, password: user.password);
        if(firebaseUser?.uid != null){
          user.pets = new List<String>();
          user.petsHistory = new List<String>();
          _collection.add(user.toMap());

          return true;
        }
      }
      throw new Exception('Email já em uso');
  }

  void addPet(String petId){
    _auth.loggedUser.pets.add(petId);
    _collection.document(_auth.loggedUser.documentID).updateData(_auth.loggedUser.toMap());
  }

  void update(String documentId, User user) =>
      _collection.document(documentId).updateData(user.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Stream<List<User>> get people =>(
    _collection.snapshots().map((query) => query.documents
      .map<User>((document) => User.fromMap(document))
      .toList())
  );

}
