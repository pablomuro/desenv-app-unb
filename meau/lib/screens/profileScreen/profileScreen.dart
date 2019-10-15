import 'package:flutter/material.dart';
import 'package:meau/screens/profileScreen/texts.dart';
import 'package:meau/services/AuthService.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:meau/widgets/GreenBtn.dart';
import 'package:meau/models/UserModel.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User user = AuthService.instance.loggedUser;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: Text(user.name,
            style: TextStyle(
            color: DefaultButtonColor, fontSize: AppTitleTextSize)
          ),
          backgroundColor: DefaultGrennColor,
          iconThemeColor: DefaultButtonColor
        ),
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
                      user.name != null ? user.name : ProfileName ,
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
                      user.age.toString() != null ? user.age.toString() : ProfileAge,
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
                      user.email != null ? user.email : ProfileEmail,
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
                      user.adrress != null ? user.adrress : ProfileAddress,
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
                      user.phone != null ? user.phone : ProfilePhone ,
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
