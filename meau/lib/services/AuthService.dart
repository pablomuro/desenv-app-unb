import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var currentUser;

  // AuthService() {
  // }

  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  // wrappinhg the firebase calls
  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    return result;
  }

  // wrapping the firebase calls
  Future createUser(
      {
      String email,
      String password}) async {}

  // logs in the user if password matches
  Future<FirebaseUser> loginUser({String email, String password}) async {
    try {
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    }  catch (e) {
      throw new AuthException(e.code, e.message);
    }
  }
}