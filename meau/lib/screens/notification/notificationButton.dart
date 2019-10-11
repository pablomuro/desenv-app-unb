import 'package:flutter/material.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/models/NotificationModel.dart' as Notify;
import 'package:meau/routes.dart';
import 'package:meau/services/AuthService.dart';
import 'package:meau/services/NotificationService.dart';

class NotificationButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User _user = AuthService.instance.loggedUser;

    if(_user != null){
      return StreamBuilder<Notify.Notification>(
        stream: NotificationService.instance.hasNotification(_user.documentID),
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