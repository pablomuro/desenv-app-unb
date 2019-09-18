import 'package:flutter/material.dart';
import 'package:meau/style.dart';

final themeDefinition = ThemeData(
  primarySwatch: Colors.grey,
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.accent,
    buttonColor: DefaultGrennColor,
  ),
  accentColor: DefaultButtonColor,
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: MenuConfigBgColor,
      ),
    )
  )
);