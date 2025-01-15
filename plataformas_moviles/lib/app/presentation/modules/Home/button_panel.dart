import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:plataformas_moviles/app/presentation/modules/Home/home.dart';
import 'package:plataformas_moviles/app/presentation/modules/Home/locker.dart';
import 'package:plataformas_moviles/app/presentation/modules/Home/record.dart';
import 'package:plataformas_moviles/app/presentation/modules/Home/shopping.dart';

class Button_Panel extends StatefulWidget {
  const Button_Panel({super.key});

  @override
  State<Button_Panel> createState() => _Button_PanelState();
}

class _Button_PanelState extends State<Button_Panel> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const Home(),
      const Locker(),
      const Card(),
      const Record(),
      const Shopping()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Inicio"),
        activeColorPrimary: const Color(0xFFFE3791),
        inactiveColorPrimary: const Color(0xFF3F3F3F),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.inventory),
        title: ("Casillero"),
        activeColorPrimary: const Color(0xFFFE3791),
        inactiveColorPrimary: const Color(0xFF3F3F3F),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        activeColorPrimary: const Color(0xFFFE3791),
        inactiveColorPrimary: const Color(0xFF3F3F3F),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.access_time),
        title: ("Historial"),
        activeColorPrimary: const Color(0xFFFE3791),
        inactiveColorPrimary: const Color(0xFF3F3F3F),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_bag),
        title: ("Comprar"),
        activeColorPrimary: const Color(0xFFFE3791),
        inactiveColorPrimary: const Color(0xFF3F3F3F),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Colors.white, // Color de fondo del Bottom Nav Bar
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarHeight: 60.0,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        colorBehindNavBar: Colors.white,
      ),
      navBarStyle: NavBarStyle.style3, // Cambiar estilo según preferencia
    );
  }
}