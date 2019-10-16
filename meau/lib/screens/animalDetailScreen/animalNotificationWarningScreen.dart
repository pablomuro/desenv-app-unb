
import 'package:flutter/material.dart';
import 'package:meau/routes.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:meau/widgets/YellownFlatButton.dart';


class AnimalNotificationWarningScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          backgroundColor: DefaultGrennColor,
          elevation: 0,
          iconThemeColor: DefaultButtonColor,
          title: Text('Adotar',
              style: TextStyle(
              color: DefaultButtonColor, fontSize: AppTitleTextSize)
            )
        ),
        drawer: AppDrawer(),
        body: ListView(
          padding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 24.0),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 52.0),
                Text('Eba!', style: TextWelcomeStyle),
                SizedBox(height: 52.0),
                Text('Uma notificação foi enviada para o dono do animal, fique no aguardo da resposta'),
                SizedBox(height: 100.0),
                YellownFlatButton(
                  text:'Voltar para Home',
                  onPressed: () => Navigator.pushNamed(context, Router.homeRoute),
                )
              ],
            )
          ])
    );
  }
}