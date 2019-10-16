import 'package:flutter/material.dart';
import 'package:meau/models/NotificationModel.dart' as Notify;
import 'package:meau/models/UserModel.dart';
import 'package:meau/routes.dart';
import 'package:meau/services/AuthService.dart';
import 'package:meau/services/NotificationService.dart';
import 'package:meau/services/UserService.dart';
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
          customActions: [],
        ),
        drawer: AppDrawer(),
        body: StreamBuilder<List<Notify.Notification>>(
        stream: NotificationService.instance.notifications,
        builder: (context, snapshot) {
          if(!snapshot.hasData) return Text("carregando...");
          // else if(snapshot.connectionState == ConnectionState.active && snapshot.hasData && snapshot.data.length == 0) Navigator.pushNamed(context, Router.homeRoute);
          return ListView(
            children: snapshot.data.map((notification) => Card(
              elevation: 3,
              child: StreamBuilder<User>(
                    stream: UserService.instance.findById(notification.userFrom),
                    builder: (context, snapshot) {
                      if(!snapshot.hasData) return Text("");
                      return InkWell(
                        onTap: () => Navigator.pushNamed(context, Router.notificationDetailRoute, arguments: {'notification': notification, 'userFrom': snapshot.data.name, 'userName': AuthService.instance.loggedUser.name}),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("From : " + snapshot.data.name),
                              Text("To : " + AuthService.instance.loggedUser.name)
                            ],
                          ),
                          subtitle: (notification.type ==  Notify.NotificationType.Request) ?  Text("Pedido de Adoção") : Text("Resposta do pedido de adoção"),
                        ),
                      );
                  }
              ),
            )).toList()
          );
        }
    ));
  }
}