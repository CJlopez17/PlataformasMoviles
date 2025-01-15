
import 'package:flutter/material.dart';
import 'package:plataformas_moviles/app/presentation/modules/Registe_Login/login.dart';

class Splash extends StatefulWidget{
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>{
  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async{
    await Future.delayed(const Duration(milliseconds: 2000), () {});

    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => const Login())
      ); 
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo1.png'),
      ),
    );
  }
}