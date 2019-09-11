import 'package:flutter/material.dart';
import 'package:meau/screens/privacidadeScreen/texts.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';

class PrivacidadeScreen extends StatelessWidget {
  static const BottomSpace = 8.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Privacidade',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    PrivacidadeHeaderText,
                    style: TextStyle(
                        fontSize: MediumTextSize, color: DefaultButtonColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: RichText(
                    text: TextSpan(
                      text: PrivacidadeArticleDescription1,
                      style: TextStyle(
                          color: DefaultTextColor, fontSize: TextSize14),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: Text(
                    PrivacidadeSubHeader1Text,
                    style: TextStyle(
                        fontSize: MediumTextSize, color: DefaultStrongreGrennColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: RichText(
                    text: TextSpan(
                      text: PrivacidadeArticleDescription2,
                      style: TextStyle(
                          color: DefaultTextColor, fontSize: TextSize14),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: Text(
                    PrivacidadeSubHeader2Text,
                    style: TextStyle(
                        fontSize: MediumTextSize, color: DefaultStrongreGrennColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: RichText(
                    text: TextSpan(
                      text: PrivacidadeArticleDescription3,
                      style: TextStyle(
                          color: DefaultTextColor, fontSize: TextSize14),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: Text(
                    PrivacidadeSubHeader3Text,
                    style: TextStyle(
                        fontSize: MediumTextSize, color: DefaultStrongreGrennColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: RichText(
                    text: TextSpan(
                      text: PrivacidadeArticleDescription4,
                      style: TextStyle(
                          color: DefaultTextColor, fontSize: TextSize14),
                    ),
                  ),
                ),
              ],
            ),
          )
        ])));
  }
}
