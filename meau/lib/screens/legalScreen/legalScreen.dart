import 'package:flutter/material.dart';
import 'package:meau/screens/legalScreen/texts.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';

class LegalScreen extends StatelessWidget {
  static const BottomSpace = 8.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Legislação',
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
                    LegalHeaderText,
                    style: TextStyle(
                        fontSize: MediumTextSize, color: DefaultButtonColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: Text(
                    LegalSubHeaderText,
                    style: TextStyle(
                        fontSize: SmallTextSize, color: DefaultStrongreGrennColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: RichText(
                    text: TextSpan(
                      text: FourthArticleText,
                      style: TextStyle(
                          color: DefaultStrongreGrennColor, fontSize: TextSize14),
                      children: [
                        TextSpan(
                          text: FourthArticleDescriptionText,
                          style: TextStyle(
                              color: DefaultTextColor, fontSize: TextSize14),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: RichText(
                    text: TextSpan(
                      text: FiftArticleText,
                      style: TextStyle(
                          color: DefaultStrongreGrennColor, fontSize: TextSize14),
                      children: [
                        TextSpan(
                          text: FiftArticleDescriptionText,
                          style: TextStyle(
                              color: DefaultTextColor, fontSize: TextSize14),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: RichText(
                    text: TextSpan(
                      text: SixthArticleText,
                      style: TextStyle(
                          color: DefaultStrongreGrennColor, fontSize: TextSize14),
                      children: [
                        TextSpan(
                          text: SixthArticleDescriptionText,
                          style: TextStyle(
                              color: DefaultTextColor, fontSize: TextSize14),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: RichText(
                    text: TextSpan(
                      text: SeventhArticleText,
                      style: TextStyle(
                          color: DefaultStrongreGrennColor, fontSize: TextSize14),
                      children: [
                        TextSpan(
                          text: SeventArticleDescriptionText,
                          style: TextStyle(
                              color: DefaultTextColor, fontSize: TextSize14),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ])));
  }
}
