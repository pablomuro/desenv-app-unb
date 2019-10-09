import 'package:flutter/material.dart';
import 'package:meau/screens/registerScreen/registerForm.dart';
import 'package:meau/screens/registerScreen/texts.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Cadastro Pessoal',
                style: TextStyle(
                    color: DefaultButtonColor, fontSize: AppTitleTextSize)),
            backgroundColor: DefaultGrennColor,
            elevation: 2,
            iconTheme: IconThemeData(color: DefaultButtonColor)),
        drawer: AppDrawer(),
        body: Container(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: MenuInfoBgColor
                        ),
                        child: Text(
                          RegisterInfo,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 28.0),
                      RegisterForm(),
                    ],
                  ))
              ])
        )
    );
  }
}
