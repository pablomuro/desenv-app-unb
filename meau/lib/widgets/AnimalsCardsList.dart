
import 'package:flutter/material.dart';
import 'package:meau/models/AnimalModel.dart';
import 'package:meau/routes.dart';
import 'package:meau/services/AnimalService.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/CustomAppBar/CustomAppBar.dart';

class AnimalsCardsList extends StatefulWidget {

  final Color appBarColor;
  final String title;
  final ScrenType screenType;
  
  AnimalsCardsList({this.title, this.appBarColor, this.screenType});

  @override
  AnimalsCardsListState createState() {
    return AnimalsCardsListState();
  }
}

class AnimalsCardsListState extends State<AnimalsCardsList> {

  @override
  Widget build(BuildContext context) {
    Stream<List<Animal>> screenStream = (widget.screenType == ScrenType.MyPets) ? AnimalService.instance.myPets : AnimalService.instance.animals;
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
        body: StreamBuilder<List<Animal>>(
        stream: screenStream,
        builder: (context, snapshot) {
          if(!snapshot.hasData) return Container( child: Text('Carregando...'));
          return ListView(
            children: snapshot.data.map((animal) => Card(
              child: Card(
                elevation: 3,
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, Router.animalDetails,
                    arguments: {'title': animal.name, 'appBarColor': widget.appBarColor, 'screenType': widget.screenType, 'animalId': animal.documentID}
                  ),
                  child: Column(
                    children: [Container(
                      decoration: BoxDecoration(color: DefaultYellowColor),
                      child: new ListTile(
                        title: Container(
                          child: Text(animal.name, style: TextStyle(color: DefaultButtonColor, fontSize: MediumTextSize)),
                        ),
                        trailing: Icon(Icons.favorite_border),
                      ),
                    ),
                    Container(
                      child: Image.memory(animal.animalImage),
                    ),
                    Container(
                      child:Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(animal.sex.toString().split('.').last, style: TextStyle(color: DefaultButtonColor, fontSize: TextSize14)),
                          Text(animal.age.toString().split('.').last, style: TextStyle(color: DefaultButtonColor, fontSize: TextSize14)),
                          Text(animal.size.toString().split('.').last, style: TextStyle(color: DefaultButtonColor, fontSize: TextSize14)),
                        ],
                      )
                    )
                    ],
                  ),
                ),
              ),
            )).toList()
          );
        }
    ));
  }
}

enum ScrenType{
  MyPets,
  Adopt
}