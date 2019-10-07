import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/services/AuthService.dart';


class UserService{
  CollectionReference _collection = Firestore.instance.collection('users');
  final AuthService auth = new AuthService();

  Stream<User> findById(String _documentId)  => _collection.where('_documentId', isEqualTo: _documentId).limit(1).snapshots().map(
    (query) => User.fromMap(query.documents[0])
  );
  Stream<User> findByEmail(String email)  => _collection.where('email', isEqualTo: email).limit(1).snapshots().map(
    (query) => User.fromMap(query.documents[0])
  );

  Stream<bool> emailAlreadyRegister(String email) => _collection.where('email', isEqualTo: email).limit(1).snapshots().map(
    (query) =>  (query.documents.length > 0) ? true : false
  );

  void add(User user){
    emailAlreadyRegister(user.email).listen((result){
      if(result == false){
        user.pets = new List<DocumentSnapshot>();
        _collection.add(user.toMap());
        auth.createUser(email: user.email, password: user.password);
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
