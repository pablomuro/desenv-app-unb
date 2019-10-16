import 'package:flutter/material.dart';
import 'package:meau/models/NotificationModel.dart' as Notify;
import 'package:meau/models/UserModel.dart';
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
          if(!snapshot.hasData) return Container();
          return ListView(
            children: snapshot.data.map((notification) => Card(
              elevation: 3,
              child: InkWell(
                onTap: () => null,
                child: new ListTile(
                  title: StreamBuilder<User>(
                    stream: UserService.instance.findById(notification.userFrom),
                    builder: (context, snapshot) {
                      if(!snapshot.hasData) return Text("");
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("From : " + snapshot.data.name),
                          Text("To : " + AuthService.instance.loggedUser.name)
                        ],
                      );
                    }
                  ),
                  subtitle: (notification.type ==  Notify.NotificationType.Request) ?  Text("Pedido de Adoção") : Text("Resposta do pedido de adoção"),
                  
                ),
              ),
            )).toList()
          );
        }
    ));
  }
}