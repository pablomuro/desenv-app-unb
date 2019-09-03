import 'package:flutter/material.dart';
import 'package:meau/Common/AssetsConstants.dart';
import 'package:meau/Common/TextsConstants.dart';
import 'package:meau/screens/legalScreen/texts.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/YellownFlatButton.dart';

class LegalScreen extends StatelessWidget {
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
        drawer: Drawer(),
        body: Container(
                child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                LegalHeaderText,
                style: TextStyle(
                    fontSize: MediumTextSize, color: DefaultButtonColor),
              ),
              Text(
                LegalSubHeaderText,
                style: TextStyle(
                    fontSize: SmallTextSize, color: DefaultStrongreGrennColor),
              ),
              RichText(
                text: TextSpan( text:'tesd',)
              ),
              RichText(
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
              RichText(
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
              RichText(
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
              RichText(
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
                        ],
                      )
              
            ])));
  }
}
