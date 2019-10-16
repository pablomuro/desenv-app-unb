
import 'package:flutter/material.dart';
import 'package:meau/models/AnimalModel.dart';
import 'package:meau/routes.dart';
import 'package:meau/services/AnimalService.dart';
import 'package:meau/services/NotificationService.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AnimalsCardsList.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:meau/widgets/YellownFlatButton.dart';

class AnimalsDetailScreen extends StatefulWidget {

  final String animalId;
  final Color appBarColor;
  final String title;
  final ScrenType screenType;
  
  AnimalsDetailScreen({this.title, this.appBarColor, this.screenType, this.animalId});

  @override
  AnimalsDetailScreenState createState() {
    return AnimalsDetailScreenState();
  }
}

class AnimalsDetailScreenState extends State<AnimalsDetailScreen> {

  NotificationService notificationService = NotificationService.instance;

  sendNotification(String ownerId, String petId) async{

    bool result = await notificationService.sendNewNotification(ownerId, petId);
    if(result){
      Navigator.pushNamed(context, Router.animalDetailsNotificationWarning);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    Stream<Animal> animalStream = AnimalService.instance.findById(widget.animalId);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          backgroundColor: widget.appBarColor,
          elevation: 0,
          iconThemeColor: DefaultButtonColor,
          title: Text(widget.title,
              style: TextStyle(
              color: DefaultButtonColor, fontSize: AppTitleTextSize)
            )
        ),
        drawer: AppDrawer(),
        body: StreamBuilder<Animal>(
        stream: animalStream,
        builder: (context, snapshot) {
          final Animal animal = snapshot.data;
          if(!snapshot.hasData) return Container( child: Text('Carregando...'));
          return ListView(
            children: [
              Container(
                child: Image.memory(animal.animalImage),
              ),
              Container(
                child: Column(
                  children: [
                    Text(animal.name),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flex(
                          direction: Axis.vertical,
                          children: [
                            Text('Sexo'),
                            Text('Macho')
                          ],
                        ),
                        Flex(
                          direction: Axis.vertical,
                          children: [
                            Text('Porte'),
                            Text('Medio')
                          ],
                        ),
                        Flex(
                          direction: Axis.vertical,
                          children: [
                            Text('Idade'),
                            Text('Adulto')
                          ],
                        ),
                      ],
                    ),
                    (widget.screenType == ScrenType.MyPets)?
                      YellownFlatButton(
                        text: 'Pretendo Adotar',
                        onPressed: () => sendNotification(animal.documentID, animal.owner),
                      )
                      : null
                  ],
                ),
              ),
              
            ],
          );
        }
        )
    );
  }
}