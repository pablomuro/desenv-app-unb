import 'package:flutter/material.dart';
import 'package:meau/screens/dicasScreen/texts.dart';
import 'package:meau/style.dart';
import 'package:meau/widgets/AppDrawer/AppDrawer.dart';
import 'package:meau/widgets/CustomAppBar/CustomAppBar.dart';

class DicasScreen extends StatelessWidget {
  static const BottomSpace = 8.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            title: Text('Dicas',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    DicasHeaderText,
                    style: TextStyle(
                        fontSize: MediumTextSize, color: DefaultButtonColor),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    DicasSubHeader1Text,
                    style: TextStyle(
                        fontSize: MediumTextSize,
                        color: DefaultStrongreGrennColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: RichText(
                    text: TextSpan(
                      text: DicasArticleDescription1,
                      style: TextStyle(
                          color: DefaultTextColor, fontSize: TextSize14),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: Text(
                    DicasSubHeader1Text,
                    style: TextStyle(
                        fontSize: MediumTextSize,
                        color: DefaultStrongreGrennColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: RichText(
                    text: TextSpan(
                      text: DicasArticleDescription2,
                      style: TextStyle(
                          color: DefaultTextColor, fontSize: TextSize14),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: Text(
                    DicasSubHeader2Text,
                    style: TextStyle(
                        fontSize: MediumTextSize,
                        color: DefaultStrongreGrennColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: RichText(
                    text: TextSpan(
                      text: DicasArticleDescription3,
                      style: TextStyle(
                          color: DefaultTextColor, fontSize: TextSize14),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: Text(
                    DicasSubHeader3Text,
                    style: TextStyle(
                        fontSize: MediumTextSize,
                        color: DefaultStrongreGrennColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: BottomSpace),
                  child: RichText(
                    text: TextSpan(
                      text: DicasArticleDescription4,
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
