import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/services/UserService.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserService _userService = UserService.instance;
  FirebaseUser currentFirebaseUser;
  User loggedUser;

  static final AuthService instance = AuthService._internal();

  factory AuthService() {
    return instance;
  }

  AuthService._internal();

  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  bool isLogged(){
    if(loggedUser != null){
      return true;
    }
    return false;
  }

  // wrappinhg the firebase calls
  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    loggedUser = null;
    return result;
  }

  // wrapping the firebase calls
  Future<FirebaseUser> createUser({String email, String password}) async {
    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  // logs in the user if password matches
  Future<FirebaseUser> loginUser({String email, String password}) async {
    try {
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if(result.user?.uid != null){
        User _loggedUser = await _userService.findByEmail(email).first;
        loggedUser = _loggedUser;
      }
      return result.user;
    } on AuthException catch (e) {
      throw new AuthException(e.code, e.message);
    } on Exception catch (e){
      throw new Exception(e);
    }
  }
}