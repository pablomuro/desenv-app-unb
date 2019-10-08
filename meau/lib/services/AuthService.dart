import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var currentUser;

  static final AuthService instance = AuthService._internal();

  factory AuthService() {
    return instance;
  }

  AuthService._internal();

  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  // wrappinhg the firebase calls
  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    return result;
  }

  // wrapping the firebase calls
  Future<FirebaseUser> createUser({String email, String password}) async {
    try {
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } on AuthException catch (e) {
      throw new AuthException(e.code, e.message);
    } on Exception catch (e){
      throw new Exception(e);
    }
  }

  // logs in the user if password matches
  Future<FirebaseUser> loginUser({String email, String password}) async {
    try {
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } on AuthException catch (e) {
      throw new AuthException(e.code, e.message);
    } on Exception catch (e){
      throw new Exception(e);
    }
  }
}