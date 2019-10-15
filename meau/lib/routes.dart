import 'package:flutter/material.dart';
import 'package:meau/screens/cadastroAnimalScreen/cadastroAnimalSucess.dart';
import 'package:meau/screens/homeScreen.dart';
import 'package:meau/screens/legalScreen/legalScreen.dart';
import 'package:meau/screens/notification/notificationScreen.dart';
import 'package:meau/screens/registerScreen/opsScreen.dart';
import 'package:meau/screens/registerScreen/registerScreen.dart';
import 'package:meau/screens/termosScreen/termosScreen.dart';
import 'package:meau/screens/privacidadeScreen/privacidadeScreen.dart';
import 'package:meau/screens/dicasScreen/dicasScreen.dart';
import 'package:meau/screens/splashScreen.dart';
import 'package:meau/screens/logInScreen/logInScreen.dart';
import 'package:meau/screens/cadastroAnimalScreen/cadastroAnimal.dart';
import 'package:meau/services/AuthService.dart';
import 'package:meau/screens/profileScreen/profileScreen.dart';
import 'package:meau/widgets/AnimalsCardsList.dart';

class Router {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String logoutRoute = '/logout';
  static const String registerRoute = '/register';
  static const String legalRoute = '/legal';
  static const String termosRoute = '/termos';
  static const String privacidadeRoute = '/privacidade';
  static const String dicasRoute = '/dicas';
  static const String cadastroAnimal = '/cadastroAnimal';
  static const String cadastroAnimalSucess = '/cadastroAnimalSucess';
  static const String opsRoute = '/ops';
  static const String profileRoute = '/perfil';
  static const String notificationListRoute = '/notification-list';
  static const String adoption = '/adoption';

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
      case cadastroAnimalSucess:
        if(!_auth.isLogged()) return MaterialPageRoute(builder: (_) => OpsScreen());

        return MaterialPageRoute(builder: (_) => CadastroAnimalSucessScreen());
      case loginRoute:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => LogInScreen());
      case registerRoute:
      if(_auth.isLogged()) return MaterialPageRoute(builder: (_) => ProfileScreen());
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
      case logoutRoute:
        _auth.logout();
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case profileRoute:
        if(!_auth.isLogged()) return MaterialPageRoute(builder: (_) => OpsScreen());
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case notificationListRoute:
        if(!_auth.isLogged()) return MaterialPageRoute(builder: (_) => OpsScreen());
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case adoption:
        if(!_auth.isLogged()) return MaterialPageRoute(builder: (_) => OpsScreen());
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => AnimalsCardsList());
      default:
        // var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
