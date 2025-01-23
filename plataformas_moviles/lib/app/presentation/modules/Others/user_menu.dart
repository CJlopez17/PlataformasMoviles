import 'package:flutter/material.dart';
import 'package:plataformas_moviles/app/presentation/modules/%20Profile/configuration.dart';
import 'package:plataformas_moviles/app/presentation/modules/%20Profile/profile.dart';

class UserMenu extends StatelessWidget {
  final String userName;
  final String userImagePath;

  const UserMenu({
    super.key,
    required this.userName,
    required this.userImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'Perfil') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Profile()),
          );
        } else if (value == 'Configuraciones') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Configuration()),
          );
        } else if (value == 'Salir') {
          _showAlertDialog(context);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Perfil',
          child: Text('Perfil'),
        ),
        const PopupMenuItem<String>(
          value: 'Configuraciones',
          child: Text('Configuraciones'),
        ),
        const PopupMenuItem<String>(
          value: 'Salir',
          child: Text('Salir'),
        ),
      ],
      child: TextButton(
        onPressed: null, // No se necesita acción aquí
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              userName,
              style: const TextStyle(
                color: Color(0xFF3F3F3F),
                fontSize: 17,
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(
              userImagePath,
              height: 30,
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 27,
              color: Color(0xFF3F3F3F),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content: const Text('¿Estás seguro de que deseas salir?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              child: const Text('Salir'),
            ),
          ],
        );
      },
    );
  }
}
