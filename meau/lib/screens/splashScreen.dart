import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meau/Common/AssetsConstants.dart';
import 'package:meau/routes.dart';
import 'package:meau/style.dart';

class SplashScreen extends StatefulWidget {
  @override
  _StateSplashScreen createState() => _StateSplashScreen();
}

class _StateSplashScreen extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(
      Duration(seconds: 3), 
      () => Navigator.of(context).pushReplacementNamed(Router.homeRoute)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: DefaultGrennColor,
          image: DecorationImage(
            image: AssetImage(SplashBackround),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(50.0),
          constraints: BoxConstraints.expand(height: 100.0, width: 276.0),
          child: Image.asset(MeuaLogoWhite, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
