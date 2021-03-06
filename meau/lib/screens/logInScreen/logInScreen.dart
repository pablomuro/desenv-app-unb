import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meau/screens/logInScreen/loginForm.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/CustomAppBar/CustomAppBar.dart';

class LogInScreen extends StatelessWidget {
  static const BottomSpace = 8.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            title: Text('Login',
              style: TextStyle(
              color: DefaultButtonColor, fontSize: AppTitleTextSize)
            ),
            backgroundColor: DefaultGrennColor,
            iconThemeColor: DefaultButtonColor
        ),
        drawer: AppDrawer(),
        body: Container(
            child: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 64.0),
                LoginForm(),
                SizedBox(height: 72.0),
                Container(
                    width: 240.0,
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
                SizedBox(height: 8.0),
                Container(
                    width: 240.0,
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
