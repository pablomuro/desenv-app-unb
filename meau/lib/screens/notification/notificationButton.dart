import 'package:flutter/material.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/models/NotificationModel.dart' as Notify;
import 'package:meau/routes.dart';
import 'package:meau/services/AuthService.dart';
import 'package:meau/services/NotificationService.dart';

class NotificationButton extends StatefulWidget {

  @override
  NotificationButtonState createState() {
    return NotificationButtonState();
  }
}

class NotificationButtonState extends State<NotificationButton> {

  User _user = AuthService.instance.loggedUser;
  NotificationService notificationService = NotificationService.instance;
  

  @override
  Widget build(BuildContext context) {
    if(_user != null){
      return StreamBuilder<Notify.Notification>(
        stream: notificationService.hasNotification(_user.documentID),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return Container();
          return IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () => Navigator.pushNamed(context, Router.notificationListRoute)
          );
        }
      );
    }else{
      return Container();
    }
  }
}