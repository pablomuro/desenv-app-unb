import 'package:flutter/material.dart';
import 'package:meau/screens/homeScreen.dart';
import 'package:meau/screens/legalScreen/legalScreen.dart';
import 'package:meau/screens/registerScreen/opsScreen.dart';
import 'package:meau/screens/registerScreen/registerScreen.dart';
import 'package:meau/screens/termosScreen/termosScreen.dart';
import 'package:meau/screens/privacidadeScreen/privacidadeScreen.dart';
import 'package:meau/screens/dicasScreen/dicasScreen.dart';
import 'package:meau/screens/splashScreen.dart';
import 'package:meau/screens/logInScreen/logInScreen.dart';
import 'package:meau/screens/cadastroAnimalScreen/cadastroAnimal.dart';
import 'package:meau/services/AuthService.dart';

class Router {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String legalRoute = '/legal';
  static const String termosRoute = '/termos';
  static const String privacidadeRoute = '/privacidade';
  static const String dicasRoute = '/dicas';
  static const String cadastroAnimal = '/cadastroAnimal';
  static const String opsRoute = '/ops';



  static Route<dynamic> generateRoute(RouteSettings settings) {
      AuthService _auth = AuthService.instance;

    switch (settings.name) {
      case splashRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case homeRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case cadastroAnimal:
        if(!_auth.isLogged()) return MaterialPageRoute(builder: (_) => OpsScreen());

        return MaterialPageRoute(builder: (_) => CadastroAnimalScreen());
      case loginRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => LogInScreen());
      case registerRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => RegisterScreen());
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
      default:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
