import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PackageDetailScreen extends StatelessWidget {
  final DocumentSnapshot paquete;
  const PackageDetailScreen({super.key, required this.paquete});

  @override
  Widget build(BuildContext context) {
    var paqueteData = paquete.data() as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(title: const Text("Detalles del Paquete")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.qr_code,
                  color: Color(0xFFFF1E68)), // Aquí se cambia el color
              title: Text("Tracking: ${paqueteData['tracking'] ?? 'N/A'}"),
            ),
            ListTile(
              leading: const Icon(Icons.local_shipping, color: Color(0xFFFF1E68)),
              title: Text("Estado: ${paqueteData['estado'] ?? 'Desconocido'}"),
            ),
            ListTile(
              leading: const Icon(Icons.date_range, color: Color(0xFFFF1E68)),
              title: Text(
                  "Fecha: ${paqueteData['timestamp'] != null ? DateFormat('dd/MM/yyyy').format(paqueteData['timestamp'].toDate()) : 'N/A'}"),
            ),
            ListTile(
              leading: const Icon(Icons.store, color: Color(0xFFFF1E68)),
              title: Text("Tienda: ${paqueteData['tienda'] ?? 'N/A'}"),
            ),
            ListTile(
              leading: const Icon(Icons.category, color: Color(0xFFFF1E68)),
              title: Text("Contenido: ${paqueteData['contenido'] ?? 'N/A'}"),
            ),
            ListTile(
              leading: const Icon(Icons.attach_money, color: Color(0xFFFF1E68)),
              title: Text(
                  "Valor Comercial: \$${paqueteData['valor_comercial'] ?? 'N/A'}"),
            ),
          ],
        ),
      ),
    );
  }
}
