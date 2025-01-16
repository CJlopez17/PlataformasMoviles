import 'package:flutter/material.dart';
import 'package:plataformas_moviles/app/routes/app_routes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                // Maneja las acciones según la opción seleccionada
                if (value == 'Perfil') {
                  // Navegar a la página de perfil
                  print('Ir a perfil');
                } else if (value == 'Configuraciones') {
                  // Navegar a la configuración
                  print('Ir a configuraciones');
                } else if (value == 'Salir') {
                  // Cerrar sesión
                  Navigator.pushNamed(context, '/login');
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
                onPressed:
                    null, // No necesitas esta acción porque el PopupMenuButton se encarga del evento
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Camilo Godoy',
                      style: TextStyle(
                        color: Color(0xFF3F3F3F),
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/persona.png',
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
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.qr_code, color: Color(0xFF3F3F3F)),
                  hintText: 'SHIPPING12312XXXX',
                  hintStyle: const TextStyle(color: Color(0xFFD9D9D9)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Color(0xFF7266BA))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Color(0xFF7266BA))),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFD9D9D9)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.inventory_2_outlined, "PAQUETES"),
                  _buildNavItem(Icons.shopping_cart_outlined, "COMPRAR"),
                  _buildNavItem(Icons.calculate_outlined, "COTIZAR"),
                  _buildNavItem(Icons.support_agent_outlined, "CONTACTO"),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 5),
                child: Text('PEDIDO ACTUAL',
                    style: TextStyle(color: Color(0xFF3F3F3F), fontSize: 20)),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.local_shipping, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      const Text(
                        '#HWDSF776567DS',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'EN CAMINO · 24 DIC',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTrackingLine(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DESDE',
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Miami',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'A',
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Cuenca',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 5),
                child: Text('PEDIDOS ANTERIORES',
                    style: TextStyle(color: Color(0xFF3F3F3F), fontSize: 20)),
              ),
            ),
            const SizedBox(height: 23),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.local_shipping, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      const Text(
                        '#HWDSF776567DS',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'EN CAMINO · 24 DIC',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DESDE',
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Miami',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'A',
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Cuenca',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildNavItem(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 40, color: const Color(0xFF7266BA)),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF3F3F3F),
        ),
      ),
    ],
  );
}

Widget _buildTrackingLine() {
  return Stack(
    children: [
      Container(
        height: 2,
        color: Colors.grey[200],
      ),
      Container(
        height: 2,
        width: 2,
        color: const Color(0xFFFF1E68),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDot(true),
          _buildDot(true),
          _buildDot(true),
          _buildDot(false),
          _buildDot(false),
        ],
      ),
    ],
  );
}

Widget _buildDot(bool completed) {
  return Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: completed ? const Color(0xFFFF1E68) : Colors.white,
      border: Border.all(
        color: completed ? const Color(0xFFFF1E68) : const Color(0xFFEDEDED),
        width: 2,
      ),
    ),
    child: completed
        ? const Icon(
            Icons.check,
            color: Colors.white,
            size: 16,
          )
        : null,
  );
}
