import 'package:flutter/material.dart';
import '../Others/user_menu.dart';

class Locker extends StatefulWidget {
  const Locker({super.key});

  @override
  State<Locker> createState() => _LockerState();
}

class _LockerState extends State<Locker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hola'),
      ),
    );
  }
}