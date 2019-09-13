import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meau/screens/logInScreen/loginForm.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';

class LogInScreen extends StatelessWidget {
  static const BottomSpace = 8.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Login',
                style: TextStyle(
                    color: DefaultButtonColor, fontSize: AppTitleTextSize)),
            backgroundColor: DefaultGrennColor,
            elevation: 2,
            iconTheme: IconThemeData(color: DefaultButtonColor)),
        drawer: AppDrawer(),
        body: Container(
            child: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 64),
                ),
                LoginForm(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 36.0),
                ),
                Container(
                    width: 232.0,
                    height: 40.0,
                    child: RaisedButton.icon(
                      textColor: Colors.white,
                      color: FacebookBtnColor,
                      icon: Icon(FontAwesomeIcons.facebook),
                      label: Text(
                        'ENTRAR COM FACEBOOK',
                      ),
                      onPressed: () => null,
                    )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                ),
                Container(
                    width: 232.0,
                    height: 40.0,
                    child: RaisedButton.icon(
                      textColor: Colors.white,
                      color: GoogleBtnColor,
                      icon: Icon(FontAwesomeIcons.google),
                      label: Text('ENTRAR COM GOOGLE'),
                      onPressed: () => null,
                    )),
              ],
            ),
          )
        ])));
  }
}
