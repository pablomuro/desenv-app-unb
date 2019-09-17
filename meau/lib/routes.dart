import 'package:flutter/material.dart';
import 'package:meau/screens/homeScreen.dart';
import 'package:meau/screens/legalScreen/legalScreen.dart';
import 'package:meau/screens/termosScreen/termosScreen.dart';
import 'package:meau/screens/privacidadeScreen/privacidadeScreen.dart';
import 'package:meau/screens/dicasScreen/dicasScreen.dart';
import 'package:meau/screens/splashScreen.dart';
import 'package:meau/screens/cadastroAnimalScreen/cadastroAnimal.dart';
import 'package:meau/screens/profileScreen/profileScreen.dart';

class Router {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String legalRoute = '/legal';
  static const String termosRoute = '/termos';
  static const String privacidadeRoute = '/privacidade';
  static const String dicasRoute = '/dicas';
  static const String cadastroAnimal = '/cadastroAnimal';
  static const String profileRoute = '/perfil';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case homeRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case cadastroAnimal: 
        return MaterialPageRoute(builder: (_) => CadastroAnimalScreen());
      case loginRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case legalRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => LegalScreen());
      case termosRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => TermosScreen());
      case privacidadeRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => PrivacidadeScreen());
      case dicasRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => DicasScreen());
        case profileRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      default:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
