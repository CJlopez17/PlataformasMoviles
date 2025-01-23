import 'package:flutter/material.dart';
import 'package:plataformas_moviles/app/presentation/modules/%20Profile/configurations_pages/address_format.dart';
import 'package:plataformas_moviles/app/presentation/modules/%20Profile/configuration.dart';
import 'package:plataformas_moviles/app/presentation/modules/%20Profile/profile.dart';
import '../presentation/modules/Home/button_panel.dart';
import '../presentation/modules/Registe_Login/login.dart';
import '../presentation/modules/Registe_Login/register_company.dart';
import '../presentation/modules/Others/splash.dart';
import '../presentation/modules/Registe_Login/register_person.dart';
import '../presentation/modules/Registe_Login/select_account.dart';

class AppRoutes {
  static const String login = '/login';
  static const String selectAccount = '/select_account';
  // ignore: constant_identifier_names
  static const String register_person = '/register_person';
  // ignore: constant_identifier_names
  static const String register_company = '/register_company';
  // ignore: constant_identifier_names
  static const String button_panel = '/button_panel';
  static const String profile = '/profile';
  static const String configuration = '/configuration';
  // ignore: constant_identifier_names
  static const String address_format = '/address_format';
  static const String splash = '/splash';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case selectAccount:
        return MaterialPageRoute(builder: (_) => const SelectAccount());
      case register_person:
        return MaterialPageRoute(builder: (_) => const Register_Person());
      case register_company:
        return MaterialPageRoute(builder: (_) => const Register_Company());
      case splash:
        return MaterialPageRoute(builder: (_) => const Splash());
      case button_panel:
        return MaterialPageRoute(builder: (_) => const Button_Panel());
      case profile:
        return MaterialPageRoute(builder: (_) => const Profile());
      case configuration:
        return MaterialPageRoute(builder: (_) => const Configuration());
      case address_format:
        return MaterialPageRoute(builder: (_) => const AddressFormat());

      default:
        return MaterialPageRoute(builder: (_) => const Login());
    }
  }
}
