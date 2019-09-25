import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meau/models/UserModel.dart';


class UserRepository{
  CollectionReference _collection = Firestore.instance.collection('users');

  Stream<User> findByEmail(String email)  => _collection.where('email', isEqualTo: email).limit(1).snapshots().map(
    (query) => User.fromMap(query.documents[0])
  );

  Stream<bool> emailAlreadyRegister(String email) => _collection.where('email', isEqualTo: email).limit(1).snapshots().map(
    (query) =>  (query.documents.length > 0) ? true : false
  );

  void add(User user){
    emailAlreadyRegister(user.email).listen((result){
      if(result == false){
        _collection.add(user.toMap());
      }
    });
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
