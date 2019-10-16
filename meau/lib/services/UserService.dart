import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/services/AuthService.dart';


class UserService{
  CollectionReference _collection = Firestore.instance.collection('users');
  static AuthService _auth;

  static final UserService instance = UserService._internal();

  factory UserService() {
    _auth = AuthService.instance;
    return instance;
  }

  UserService._internal();

  Stream<User> findById(String documentID)  => _collection.document(documentID).snapshots().map(
    (document) => User.fromMap(document)
  );
  Stream<User> findByEmail(String email)  => _collection.where('email', isEqualTo: email).limit(1).snapshots().map(
    (query) => User.fromMap(query.documents[0])
  );

  Stream<bool> emailAlreadyRegister(String email) => _collection.where('email', isEqualTo: email).limit(1).snapshots().map(
    (query) =>  (query.documents.length > 0) ? true : false
  );

  Future<bool> add(User user) async {
    try{
     FirebaseUser firebaseUser = await _auth.createUser(email: user.email, password: user.password);
     if(firebaseUser?.uid != null){
        user.pets = new List<String>();
        user.petsHistory = new List<String>();
        _collection.add(user.toMap());
        
        return true;
      }
      return false;
    } on AuthException catch (e) {
      throw new AuthException(e.code, e.message);
    } on Exception catch(e){
      dynamic error = e;
      if(error?.code != null){
        if(error.code == 'ERROR_EMAIL_ALREADY_IN_USE'){
          throw new Exception('O endereço de email já está em uso');
        }
        throw new Exception(error.message);
      }
      throw new Exception(e);
    }
      
  }

  void addPet(String petId){
    _auth = AuthService.instance;
    _auth.loggedUser.pets.add(petId);
    _collection.document(_auth.loggedUser.documentID).updateData(_auth.loggedUser.toMap());
  }

  void update(String documentId, User user) =>
      _collection.document(documentId).updateData(user.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

}
