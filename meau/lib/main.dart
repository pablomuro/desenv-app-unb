import 'package:flutter/material.dart';
import 'package:meau/routes.dart';
import 'package:meau/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeDefinition,
      onGenerateRoute: Router.generateRoute,
      initialRoute: Router.splashRoute,
    );
  }
}
