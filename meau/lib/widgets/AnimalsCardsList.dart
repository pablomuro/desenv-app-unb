
import 'package:flutter/material.dart';
import 'package:meau/models/AnimalModel.dart';
import 'package:meau/routes.dart';
import 'package:meau/services/AnimalService.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/CustomAppBar/CustomAppBar.dart';

class AnimalsCardsList extends StatelessWidget {

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
        body: StreamBuilder<List<Animal>>(
        stream: AnimalService.instance.myPets,
        builder: (context, snapshot) {
          if(!snapshot.hasData) return Container();
          return ListView(
            children: snapshot.data.map((animal) => Card(
              child: Card(
                elevation: 3,
                child: InkWell(
                  onTap: () => null,
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