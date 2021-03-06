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

  Stream<Animal> findById(String documentID) => _collection.document(documentID).snapshots().map(
    (document) => Animal.fromMap(document)
  );
  Stream<List<Animal>> findByOwnerId(String ownerId)  => _collection.where('owner', isEqualTo: ownerId).limit(1).snapshots().map((query) => query.documents
    .map<Animal>((document) => Animal.fromMap(document))
    .toList()
  );

  Future<bool>add(Animal animal) async {
    try{
      if(_auth.isLogged() == true){
        animal.owner = _auth.loggedUser.documentID;
        DocumentReference newAnimal = await _collection.add(animal.toMap());
        if(newAnimal.documentID != null){
          _userService.addPet(newAnimal.documentID);
          return true;
        }
      }
      return false;
    }
    on AuthException catch (e) {
      throw new AuthException(e.code, e.message);
    } on Exception catch (e){
      throw new Exception(e);
    }
  } 

  Future<void> update(Animal animal) =>
      _collection.document(animal.documentID).updateData(animal.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Stream<List<Animal>> get animals =>(
    _collection
    .where('helpAs', isEqualTo: HelpAs.Adoption.index).snapshots().map((query) => query.documents
      .where((document) => (document.data['owner'] != AuthService.instance.loggedUser.documentID) ?
          true : false
      ).map<Animal>((document) => Animal.fromMap(document))
      .toList()
    )
  );

  Stream<List<Animal>> get myPets =>(
    _collection.where('owner', isEqualTo: AuthService.instance.loggedUser.documentID).snapshots().map((query) => query.documents
      .map<Animal>((document) => Animal.fromMap(document))
      .toList())
  );

}
