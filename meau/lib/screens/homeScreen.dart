import 'package:flutter/material.dart';
import 'package:meau/Common/AssetsConstants.dart';
import 'package:meau/Common/TextsConstants.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/YellownFlatButton.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: DefaultGrennColor)),
        drawer: Drawer(),
        body: Container(
            child: Center(
              child:Column(
                children: [
                  Text('Olá!',style: TextWelcomeStyle),
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
                    onPressed: () => null,
                    text: 'Cadastrar Animal',
                  ),
                  SizedBox(height: 44.0),
                  GestureDetector(
                    onTap: () =>  null,
                    child: Text('login' ,style: TextStyle(color: DefaultGrennColor, fontSize: MediumTextSize)),
                  ),
                  SizedBox(height: 68.0),
                  SizedBox(
                    width: 122.0,
                    height: 44.0,
                    child: Image.asset(MeuaLogoGreen),
                  ),
                ]
              )
          )
        )
    );
  }
}
