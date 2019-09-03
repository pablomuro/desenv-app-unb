import 'package:flutter/material.dart';
import 'package:meau/style.dart';


class GrayText extends StatelessWidget {

  final String data;
  final TextAlign textAlign;
  
  GrayText(this.data, {
    this.textAlign = TextAlign.start
  });

  final TextStyle grayTextStyle = TextStyle(
    fontSize: TextSize14,
    color: Color(0xff434343),
  );

  @override
  Widget build(BuildContext context) {
    return Text(data, style: grayTextStyle, textAlign: textAlign);
  }

  
}