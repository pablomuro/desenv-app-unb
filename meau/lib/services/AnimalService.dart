import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meau/models/AnimalModel.dart';
import 'package:meau/services/AuthService.dart';
import 'package:meau/services/UserService.dart';


class AnimalService{
  CollectionReference _collection = Firestore.instance.collection('animals');
  static AuthService _auth;
  static UserService _userService;

  static final AnimalService instance = AnimalService._internal();

  factory AnimalService() {
    _auth = AuthService.instance;
    _userService = UserService.instance;
    return instance;
  }

  AnimalService._internal();

  Stream<Animal> findById(String _documentId)  => _collection.where('_documentId', isEqualTo: _documentId).limit(1).snapshots().map(
    (query) => Animal.fromMap(query.documents[0])
  );
  Stream<Animal> findByOwnerId(String ownerId)  => _collection.where('owner', isEqualTo: ownerId).limit(1).snapshots().map(
    (query) => Animal.fromMap(query.documents[0])
  );

  Future<bool>add(Animal animal) async {
    try{
      if(_auth.isLogged() == true){
        animal.owner = _auth.loggedUser.documentID;
        var newAnimal = await _collection.add(animal.toMap());
        _userService.addPet(newAnimal.documentID);

        return true;
      }

      return false;
    }
    on AuthException catch (e) {
      throw new AuthException(e.code, e.message);
    } on Exception catch (e){
      throw new Exception(e);
    }
  } 

  Future<bool> update(String documentId, Animal animal) =>
      _collection.document(documentId).updateData(animal.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Stream<List<Animal>> get people =>(
    _collection.snapshots().map((query) => query.documents
      .map<Animal>((document) => Animal.fromMap(document))
      .toList())
  );

}
