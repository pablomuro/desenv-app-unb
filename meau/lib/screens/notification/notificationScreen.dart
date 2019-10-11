import 'package:flutter/material.dart';
import 'package:meau/models/NotificationModel.dart' as Notify;
import 'package:meau/services/NotificationService.dart';

class NotificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      return StreamBuilder<List<Notify.Notification>>(
        stream: NotificationService.instance.notifications,
        builder: (context, snapshot) {
          if(!snapshot.hasData) return Container();
          ListView(
            
          );
        }
    );
  }
}