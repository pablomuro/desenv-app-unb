import 'package:flutter/material.dart';
import 'package:meau/screens/profileScreen/texts.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';

class ProfileScreen extends StatelessWidget {
  static const BottomSpace = 8.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Perfil',
                style: TextStyle(
                    color: DefaultButtonColor, fontSize: AppTitleTextSize)),
            backgroundColor: DefaultGrennColor,
            elevation: 2,
            iconTheme: IconThemeData(color: DefaultButtonColor)),
        drawer: AppDrawer(),
        body: Container(
            child: ListView(children: [
          Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    ProfileName,
                    style: TextStyle(
                        fontSize: MediumTextSize,
                        color: DefaultStrongreGrennColor),
                  ),
                ),
        ])));
  }
}
