import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:meau/blocs/UserBloc.dart';
import 'package:meau/routes.dart';
import 'package:meau/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //add yours BLoCs controlles
      blocs: [
        Bloc((i) => UserBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeDefinition,
        onGenerateRoute: Router.generateRoute,
        initialRoute: Router.splashRoute,
      )
    );
  }
}
