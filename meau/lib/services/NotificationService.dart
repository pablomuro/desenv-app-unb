import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meau/models/NotificationModel.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/services/AuthService.dart';

class NotificationService{
  CollectionReference _collection = Firestore.instance.collection('notifications');
  static AuthService _auth = AuthService.instance;
  static User currentUser;

  static final NotificationService instance = NotificationService._internal();

  factory NotificationService() {
    // _auth = AuthService.instance;
    currentUser = _auth.loggedUser;
    return instance;
  }

  NotificationService._internal();

  Stream<Notification> hasNotification(String documentID)  => _collection.where('userTo', isEqualTo: documentID).limit(1).snapshots().map(
    (query) => Notification.fromMap(query.documents[0])
  );

  Future<bool> add(Notification notification) async {
    try{
      if(currentUser != null){
        _collection.add(notification.toMap());
        return true;
      }
      throw new Exception('Usuário não logado');
    } on Exception catch(e){
      dynamic error = e;
      throw new Exception(error.message);
    }
  }

  Future<bool> sendNewNotification(String ownerId, String petId) async {
    Notification newNotification = new Notification();
    newNotification.userFrom = ownerId;
    newNotification.userTo = currentUser.documentID;
    newNotification.pet = petId;

    newNotification.type = NotificationType.Request;
    newNotification.seen = false;
    newNotification.response = NotificationResponse.None;

    return await this.add(newNotification);
  }

  void update(String documentId, Notification notification) =>
      _collection.document(documentId).updateData(notification.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Stream<List<Notification>> get notifications =>(
    _collection.where('userTo', isEqualTo: _auth.loggedUser.documentID).snapshots().map((query) => query.documents
      .map<Notification>((document) => Notification.fromMap(document))
      .toList())
  );

}
