import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meau/models/AnimalModel.dart';
import 'package:meau/models/NotificationModel.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/services/AnimalService.dart';
import 'package:meau/services/AuthService.dart';
import 'package:meau/services/UserService.dart';

class NotificationService{
  CollectionReference _collection = Firestore.instance.collection('notifications');
  static AuthService _auth = AuthService.instance;
  static UserService userService = UserService.instance;
  static AnimalService animaService = AnimalService.instance;
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
      if(_auth.loggedUser != null){
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
    newNotification.userFrom = _auth.loggedUser.documentID;
    newNotification.userTo = ownerId;
    newNotification.pet = petId;

    newNotification.type = NotificationType.Request;
    newNotification.seen = false;
    newNotification.response = NotificationResponse.None;

    return await this.add(newNotification);
  }

  Future<bool> processAcept(Notification notification) async {
    User newOwner = await userService.findById(notification.userFrom).first;
    Animal pet = await animaService.findById(notification.pet).first;

    newOwner.pets.add(pet.documentID);
    pet.owner = newOwner.documentID;
    pet.helpAs = HelpAs.None;

    _auth.loggedUser.pets.remove(pet.documentID);
    _auth.loggedUser.petsHistory.add(pet.documentID);

    userService.update(newOwner);
    animaService.update(pet);
    userService.update(_auth.loggedUser);

    notification.response = NotificationResponse.Accept;
    notification.type = NotificationType.Response;
    notification.userTo = newOwner.documentID;
    notification.userFrom = _auth.loggedUser.documentID;
    
    this.update(notification);

    return true;
  }

  Future<bool> processDeny(Notification notification) async {
    notification.response = NotificationResponse.Deny;
    notification.type = NotificationType.Response;
    notification.userTo = notification.userFrom;
    notification.userFrom = _auth.loggedUser.documentID;
    
    this.update(notification);

    return true;
  }

  void update(Notification notification) =>
      _collection.document(notification.documentID).updateData(notification.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Stream<List<Notification>> get notifications =>(
    _collection.where('userTo', isEqualTo: _auth.loggedUser.documentID).snapshots().map((query) => query.documents
      .map<Notification>((document) => Notification.fromMap(document))
      .toList())
  );

}
