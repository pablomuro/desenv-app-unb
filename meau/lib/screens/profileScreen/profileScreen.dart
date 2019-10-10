import 'package:flutter/material.dart';
import 'package:meau/screens/profileScreen/texts.dart';
import 'package:meau/services/AuthService.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/GreenBtn.dart';
import 'package:meau/models/UserModel.dart';

class ProfileScreen extends StatelessWidget {

  User user = AuthService.instance.loggedUser;

  
  static const BottomSpace = 8.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(user.name,
                style: TextStyle(
                    color: DefaultButtonColor, fontSize: AppTitleTextSize)),
            backgroundColor: DefaultGrennColor,
            elevation: 2,
            iconTheme: IconThemeData(color: DefaultButtonColor)),
        drawer: AppDrawer(),
        body: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
          Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      ProfileName,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultStrongreGrennColor),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      user.name,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultGrayColor),
                    ),
                  ),
                ),
          Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      ProfileAge,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultStrongreGrennColor),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      ProfileAge,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultGrayColor),
                    ),
                  ),
                ),
          Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      ProfileEmail,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultStrongreGrennColor),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      user.email,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultGrayColor),
                    ),
                  ),
                ),
          Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      Profilelocation,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultStrongreGrennColor),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      Profilelocation,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultGrayColor),
                    ),
                  ),
                ),
          Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      ProfileAddress,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultStrongreGrennColor),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      ProfileAddress,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultGrayColor),
                    ),
                  ),
                ),
          Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      ProfilePhone,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultStrongreGrennColor),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      ProfilePhone,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultGrayColor),
                    ),
                  ),
                ),
          Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      ProfileUserName,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultStrongreGrennColor),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      ProfileUserName,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultGrayColor),
                    ),
                  ),
                ),
          Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      ProfileHistory,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultStrongreGrennColor),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Center(
                    child: Text(
                      ProfileHistory,
                      style: TextStyle(
                          fontSize: MediumTextSize,
                          color: DefaultGrayColor),
                    ),
                  ),
                ), 
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16.0,
          direction: Axis.horizontal ,
            children: <Widget>[
            GreenBtn(
              onPressed: () => null,
              text: 'CHAT',
            ),
            GreenBtn(
              onPressed: () => null,
              text: 'HISTÓRIAS',
            ),
            ],
          )   

        ]),
        ),
        );
  }
}
