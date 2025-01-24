import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Para abrir enlaces

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  // Función para abrir enlaces
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2, // Dos cards por fila
          crossAxisSpacing: 10, // Espacio entre los cards
          mainAxisSpacing: 10, // Espacio entre los cards
          children: [
            // Card de Amazon
            GestureDetector(
              onTap: () {
                _launchURL('https://www.amazon.com');
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/logo_amazon.png', // Imagen del logo de Amazon
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Card de Nike
            GestureDetector(
              onTap: () {
                _launchURL('https://www.nike.com');
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/Logo-Nike-1.png', // Imagen del logo de Nike
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Card de Adidas
            GestureDetector(
              onTap: () {
                _launchURL('https://www.adidas.com');
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/logo_adidas.png', // Imagen del logo de Adidas
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
