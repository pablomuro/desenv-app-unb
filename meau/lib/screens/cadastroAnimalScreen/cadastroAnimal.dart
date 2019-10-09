import 'package:flutter/material.dart';
import 'package:meau/screens/cadastroAnimalScreen/cadastroAnimalForm.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';

class CadastroAnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Cadastro Animal',
                style: TextStyle(
                    color: DefaultButtonColor, fontSize: AppTitleTextSize)),
            backgroundColor: DefaultYellowColor,
            elevation: 2,
            iconTheme: IconThemeData(color: DefaultButtonColor)),
        drawer: AppDrawer(),
        body: ListView(
          padding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 24.0),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CadastroAnimalForm(),
              ],
            )
          ])
    );
  }
}
