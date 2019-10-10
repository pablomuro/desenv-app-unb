import 'package:flutter/material.dart';
import 'package:meau/Common/AssetsConstants.dart';
import 'package:meau/Common/TextsConstants.dart';
import 'package:meau/routes.dart';
import 'package:meau/services/AuthService.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:meau/widgets/YellownFlatButton.dart';


class HomeScreen extends StatelessWidget {

  final AuthService _auth = AuthService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconThemeColor: DefaultGrennColor
        ),
        drawer: AppDrawer(),
        body: ListView(
                  children: [Container(
              child: Center(
                  child: Column(children: [
            Text('Olá!', style: TextWelcomeStyle),
            SizedBox(height: 52.0),
            Text(
              WelcomeText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.0),
            YellownFlatButton(
              onPressed: () => null,
              text: 'Adotar',
            ),
            SizedBox(height: 12.0),
            YellownFlatButton(
              onPressed: () => null,
              text: 'Ajudar',
            ),
            SizedBox(height: 12.0),
            YellownFlatButton(
              onPressed: () => Navigator.pushNamed(context, Router.cadastroAnimal),
              text: 'Cadastrar Animal',
            ),
            SizedBox(height: 44.0),
            getLoginWidget(context),
            SizedBox(height: 68.0),
            SizedBox(
              width: 122.0,
              height: 44.0,
              child: Image.asset(MeuaLogoGreen),
            ),
          ]))),
          ],
        ));
  }
  Widget getLoginWidget(context) {
  if(_auth.loggedUser == null){
    return (GestureDetector(
              onTap: () => Navigator.pushNamed(context, Router.loginRoute),
              child: Text('login',
                  style: TextStyle(
                      color: DefaultGrennColor, fontSize: MediumTextSize)),
            ));
    }
    return Container();
  }
}
