import 'package:flutter/material.dart';
import '../presentation/modules/Home/button_panel.dart';
import '../presentation/modules/Registe_Login/login.dart';
import '../presentation/modules/Registe_Login/register_company.dart';
import '../presentation/modules/Others/splash.dart';
import '../presentation/modules/Registe_Login/register_person.dart';
import '../presentation/modules/Registe_Login/select_account.dart';

class AppRoutes {
  static const String selectAccount = '/select_account';
  static const String login = '/login';
  static const String register_person = '/register_person';
  static const String register_company = '/register_company';
  static const String button_panel = '/button_panel';
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
      case button_panel:
        return MaterialPageRoute(builder: (_) => const Button_Panel());  
       

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
