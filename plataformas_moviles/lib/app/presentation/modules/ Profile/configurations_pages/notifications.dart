import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool _notificationsEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Control de Notificaciones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Activar Notificaciones', style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: _notificationsEnable, 
                  onChanged: (bool value){
                    toggleNotifications();
                  },
                  activeColor: const Color(0xFFFE3791),
                  inactiveThumbColor: const Color(0xFF3F3F3F),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

  void toggleNotifications() {
    setState(() {
      _notificationsEnable = !_notificationsEnable;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
        child: Text(_notificationsEnable
            ? 'Notificaciones activadas'
            : 'Notificaciones desactivadas', style: const TextStyle(fontSize: 20),),
      ),
      duration: const Duration(seconds: 3),
    ));
  }
}
