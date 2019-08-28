import 'package:flutter/material.dart';
import 'package:meau/style.dart';

class YellownFlatButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String text;

  YellownFlatButton({Key key, @required this.onPressed , @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 232.0,
      height: 40.0,
      child: FlatButton(
        color: DefaultYellowColor,
        onPressed: onPressed,
        child: Text(text , style: TextYellownFlatButtonStyle),
      )
    );
  }
}