import 'package:flutter/material.dart';
import 'package:meau/screens/notification/notificationButton.dart';

class CustomAppBar extends AppBar{

  final Widget title;
  final Color backgroundColor;
  final Color iconThemeColor;
  final double elevation;

  CustomAppBar({this.title, this.backgroundColor, this.iconThemeColor, this.elevation})
  :super(
    title:title,
    backgroundColor: backgroundColor,
    iconTheme: IconThemeData(color:iconThemeColor),
    elevation: (elevation != null) ? elevation : 2,
    actions: [NotificationButton()],
  );
}