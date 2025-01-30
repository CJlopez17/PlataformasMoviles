import 'package:flutter/material.dart';
import 'package:plataformas_moviles/app/presentation/modules/%20Profile/configurations_pages/address_format.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void _showAlertDialog(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF3F3F3F),
          title: const Center(child: Text('¡Confirmación!', style: TextStyle(color: Colors.red),)),
          content: const Text(
              '" Recuerda tener configurada la dirección de tu casillero en las diferentes tiendas donde vayas a realizar tus compras. "', style: TextStyle(color: Colors.white),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Cancelar', style: TextStyle(color: Colors.white),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                _launchURL(url);
              },
              child: const Text('Abrir', style: TextStyle(color: Colors.white),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AddressFormat()), // Navega a la pantalla de dirección
                );
              },
              child: const Text('Formato de Dirección', style: TextStyle(color: Colors.red),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildCard('assets/images/logo_amazon.png', 'https://www.amazon.com'),
            _buildCard('assets/images/logo_nike.png', 'https://www.nike.com'),
            _buildCard('assets/images/logo_adidas.png', 'https://www.adidas.com'),
            _buildCard('assets/images/logo_hm.png', 'https://ec.hm.com'),
            _buildCard('assets/images/logo_temu.png', 'https://www.temu.com'),
            _buildCard('assets/images/logo_sansung.png', 'https://www.samsung.com'),
            _buildCard('assets/images/logo_shein.png', 'https://ec.shein.com'),
            _buildCard('assets/images/logo_infinix.png', 'https://bo.infinixmobility.com'),
            _buildCard('assets/images/logo_oppo.png', 'https://www.oppo.com'),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String imagePath, String url) {
    return GestureDetector(
      onTap: () {
        _showAlertDialog(context, url);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}