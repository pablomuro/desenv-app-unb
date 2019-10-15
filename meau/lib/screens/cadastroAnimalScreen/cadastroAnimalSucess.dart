import 'package:flutter/material.dart';
import 'package:meau/screens/cadastroAnimalScreen/cadastroAnimalForm.dart';
import 'package:meau/screens/cadastroAnimalScreen/texts.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:meau/widgets/YellownFlatButton.dart';

class CadastroAnimalSucessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            title: Text('Cadastro Animal',
              style: TextStyle(
              color: DefaultButtonColor, fontSize: AppTitleTextSize)
            ),
            backgroundColor: DefaultYellowColor,
            elevation: 2,
            iconThemeColor: DefaultButtonColor
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
                Text(Sucess),
                Text(VerifyNotifications),
                SizedBox(height: 100.0),
                YellownFlatButton(
                  text:'Meus Pets',
                  onPressed: () => null,
                )
              ],
            )
          ])
    );
  }
}
