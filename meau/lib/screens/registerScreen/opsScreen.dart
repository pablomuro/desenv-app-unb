import 'package:flutter/material.dart';
import 'package:meau/routes.dart';
import 'package:meau/screens/registerScreen/registerForm.dart';
import 'package:meau/screens/registerScreen/texts.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';

class OpsScreen extends StatelessWidget {
  static const BottomSpace = 8.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Cadastro',
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
                  padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 52.0),
                      Text(Ops, style: TextOpsStyle),
                      SizedBox(height: 52.0),
                      Text(Warning, style: Text14DefaultStyle, textAlign: TextAlign.center,),
                      SizedBox(height: 16.0),
                      Container(
                        width: 232.0,
                        height: 40.0,
                        child: RaisedButton(
                          child: Text('FAZER CADASTRO'),
                          onPressed: () {
                            Navigator.pushNamed(context, Router.registerRoute);
                          }
                        )
                      ),
                      SizedBox(height: 44.0),
                      Text(AlreadyRegister, style: Text14DefaultStyle),
                      SizedBox(height: 16.0),
                      Container(
                        width: 232.0,
                        height: 40.0,
                        child: RaisedButton(
                          child: Text('FAZER LOGIN'),
                          onPressed: () {
                            Navigator.pushNamed(context, Router.loginRoute);
                          }
                        )
                      )
                    ],
                  ))
              ])
        )
    );
  }
}
