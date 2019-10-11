import 'package:flutter/material.dart';
import 'package:meau/models/NotificationModel.dart' as Notify;
import 'package:meau/services/NotificationService.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/CustomAppBar/CustomAppBar.dart';

class NotificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconThemeColor: DefaultGrennColor,
          actions: null,
        ),
        drawer: AppDrawer(),
        body: StreamBuilder<List<Notify.Notification>>(
        stream: NotificationService.instance.notifications,
        builder: (context, snapshot) {
          if(!snapshot.hasData) return Container();
          return ListView(
            children: snapshot.data.map((notification) => new ListTile(
              title: Text("From : " + notification.userFrom),
              subtitle: Text("To : " + notification.userTo),
            )).toList()
          );
        }
    ));
  }
}