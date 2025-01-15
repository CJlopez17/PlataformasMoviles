import 'package:flutter/material.dart';
import '../presentation/modules/login.dart';
import '../presentation/modules/register_company.dart';
import '../presentation/modules/splash.dart';
import '../presentation/modules/register_person.dart';
import '../presentation/modules/select_account.dart';

class AppRoutes {
  static const String selectAccount = '/select_account';
  static const String login = '/login';
  static const String register_person = '/register_person';
  static const String register_company = '/register_company';
  static const String splash = '/splash';
  

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case selectAccount:
        return MaterialPageRoute(builder: (_) => const SelectAccount());
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case register_person:
        return MaterialPageRoute(builder: (_) => const Register_Person());
      case register_company:
        return MaterialPageRoute(builder: (_) => const Register_Company()); 
      case splash:
        return MaterialPageRoute(builder: (_) => const Splash());  
       

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No se encontro la ruta: ${settings.name}'),
                  ),
                ));
    }
  }
}
