import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plataformas_moviles/app/presentation/modules/Others/user_menu.dart';
import 'package:intl/intl.dart';

import 'Others_home/contacts.dart';
import 'Others_home/quote.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _usuarioEstado;

  Future<Map<String, dynamic>?> _getUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return userDoc.data();
  }

  Future<void> _getUserState() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        setState(() {
          _usuarioEstado = userDoc['state'];
        });
      } else {
        setState(() {
          _usuarioEstado = 'Estado no disponible';
        });
      }
    }
  }

  Future<List<DocumentSnapshot>> _getPaquetes() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("No hay usuario autenticado.");
      return [];
    }
    final QuerySnapshot paquetesSnapshot = await FirebaseFirestore.instance
        .collection('paquetes')
        .where('destinatario', isEqualTo: user.uid)
        .get();
    return paquetesSnapshot.docs;
  }

  double _getProgress(String estado) {
    switch (estado) {
      case 'PENDIENTE':
        return 0.1;
      case 'EN PROGRESO':
        return 0.5;
      case 'COMPLETADO':
        return 1.0;
      default:
        return 0.0;
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: FutureBuilder<Map<String, dynamic>?>(
                  future: _getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError || snapshot.data == null) {
                      return const Text("Error al cargar datos");
                    }

                    final firstName = snapshot.data!['firstName'] ?? 'Usuario';
                    final lastName = snapshot.data!['lastName'] ?? '';
                    final userImagePath = snapshot.data!['imagePath'] ??
                        'assets/images/defaultUser.png';

                    return UserMenu(
                      firstName: firstName,
                      lastName: lastName,
                      userImagePath: userImagePath,
                    );
                  }))
        ],
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
                  GestureDetector(
                onTap: () {
                  // Navegar a la pantalla Cotizar
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Quote(),
                    ),
                  );
                },
                child: _buildNavItem(Icons.calculate_outlined, "Cotizar"),
              ),
              // Botón para Contacto
              GestureDetector(
                onTap: () {
                  // Navegar a la pantalla Contacto
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Contacts(),
                    ),
                  );
                },
                child: _buildNavItem(Icons.support_agent_outlined, "Contactos"),
              ),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<List<DocumentSnapshot>>(
                future: _getPaquetes(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError ||
                      !snapshot.hasData ||
                      snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text("No se encontraron paquetes"));
                  } else {
                    final paquetes = snapshot.data!;
                    final paquetesActuales = paquetes.where((paquete) {
                      String estado = paquete['estado'] ?? 'PENDIENTE';
                      return estado == 'PENDIENTE' || estado == 'EN PROGRESO';
                    }).toList();

                    return Column(
                      children: paquetesActuales.map((paquete) {
                        return _buildPaqueteCard(paquete);
                      }).toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
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

  Widget _buildPaqueteCard(DocumentSnapshot paquete) {
    var paqueteData = paquete.data() as Map<String, dynamic>;
    String estado = paqueteData['estado'] ?? 'PENDIENTE';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 410,
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
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
          border: Border.all(
            color: const Color.fromARGB(255, 190, 190, 190),
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.local_shipping, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  paqueteData['tracking'] ?? 'Tracking no disponible',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: _getProgress(estado),
                        color: const Color(0xFFFF1E68),
                        backgroundColor: Colors.grey[300],
                        minHeight: 6,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF1E68),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Icon(Icons.check,
                              size: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _getProgress(estado) >= 0.5
                                ? const Color(0xFFFF1E68)
                                : Colors.grey[300],
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.access_time,
                            size: 20,
                            color: _getProgress(estado) >= 0.5
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: _getProgress(estado) == 1.0
                                ? const Color(0xFFFF1E68)
                                : Colors.grey[300],
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.done_all,
                            size: 20,
                            color: _getProgress(estado) == 1.0
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  '${estado} · ${_formatTimestamp(paqueteData['timestamp']) ?? 'Fecha no disponible'}',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
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
                    const Text(
                      'A',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      _usuarioEstado ?? 'Estado no disponible',
                      style: const TextStyle(
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
    );
  }

  String? _formatTimestamp(Timestamp? timestamp) {
    if (timestamp == null) return null;
    final date = timestamp.toDate();
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
