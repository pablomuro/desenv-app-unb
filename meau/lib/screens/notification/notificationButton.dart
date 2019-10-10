import 'package:flutter/material.dart';
import 'package:meau/models/UserModel.dart';
import 'package:meau/services/AuthService.dart';

class NotificationButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User _user = AuthService.instance.loggedUser;
    if(_user != null){
      return IconButton(
        icon: Icon(Icons.notifications_active),
        onPressed: () => {},
      );
    }else{
      return Container();
    }
  }
}