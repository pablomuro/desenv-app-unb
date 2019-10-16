
import 'package:flutter/material.dart';
import 'package:meau/models/AnimalModel.dart';
import 'package:meau/models/NotificationModel.dart' as Notify;
import 'package:meau/routes.dart';
import 'package:meau/services/AnimalService.dart';
import 'package:meau/services/NotificationService.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:meau/widgets/YellownFlatButton.dart';

class NotificationDetailsScreen extends StatefulWidget {
  final Notify.Notification notification;
  final String userFrom;
  final String userName;

  NotificationDetailsScreen({this.notification, this.userFrom, this.userName});

  @override
  NotificationDetailsState createState() {
    return NotificationDetailsState();
  }

}
class NotificationDetailsState extends State<NotificationDetailsScreen> {

  processResponse(Notify.NotificationResponse response) async {
    bool result = false;
    if(response == Notify.NotificationResponse.Accept){
      result = await NotificationService.instance.processAcept(widget.notification);
    }
    else{
      result = await NotificationService.instance.processDeny(widget.notification);
    }
    if(result){
      Navigator.pushNamed(context, Router.homeRoute);
    }
  }

  deleteNotification(String documentID) {
    NotificationService.instance.delete(documentID);
    Navigator.pushNamed(context, Router.homeRoute);
  }

  getTextForAdoption(String username, String userFrom, String petName){
    return Text("Olá, " + username + "\nO usuário "+ userFrom +" está querendo adotar o seu animal de nome " + petName);
  }
  getTextForResponse(String username, String userFrom, String petName, Notify.Notification notification){
    if(notification.response == Notify.NotificationResponse.Accept){
      return Text("Olá, " + username + "\nSeu pedido foi aceito e o processo de adoção foi finalizado");
    }

    return Text("Olá, " + username + "\nSeu pedido não foi aceito pelo dono do animal :(");
    
  }

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
        body: StreamBuilder<Animal>(
        stream: AnimalService.instance.findById(widget.notification.pet),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return Container( child: Text('Carregando...'));
          return ListView(
            padding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 24.0),
            children: [
              (widget.notification.type == Notify.NotificationType.Request) ? getTextForAdoption(widget.userName, widget.userFrom, snapshot.data.name) :getTextForResponse(widget.userName, widget.userFrom, snapshot.data.name, widget.notification) ,
              SizedBox(height: 100.0),
              (widget.notification.type == Notify.NotificationType.Request)?
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  YellownFlatButton(
                    text: "Aceitar",
                    onPressed: () => processResponse(Notify.NotificationResponse.Accept),
                  ),
                  FlatButton(
                    color: Colors.grey,
                    child: Text('Recusar'),
                    onPressed: () => processResponse(Notify.NotificationResponse.Deny),
                  )
                ],
              ) : FlatButton(
                    color: Colors.grey,
                    child: Text('Deletar Notificação'),
                    onPressed: (){deleteNotification(widget.notification.documentID);},
                  )
            ]
          );
        })
    );
  }
}