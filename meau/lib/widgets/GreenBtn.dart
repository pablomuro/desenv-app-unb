import 'package:flutter/material.dart';
import 'package:meau/style.dart';

class GreenBtn extends StatelessWidget {

  final VoidCallback onPressed;
  final String text;

  GreenBtn({Key key, @required this.onPressed , @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: 50.0,
      child: FlatButton(
        color: DefaultGrennColor,
        onPressed: onPressed,
        child: Text(text , style: TextGreenBtn),
      )
    );
  }
}