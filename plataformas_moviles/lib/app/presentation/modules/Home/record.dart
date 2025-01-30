import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plataformas_moviles/app/presentation/modules/Home/package_detail.dart';
import 'package:plataformas_moviles/app/presentation/modules/Others/user_menu.dart';
import 'package:intl/intl.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  Future<List<DocumentSnapshot>> _getPaquetes({String? estado}) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("No hay usuario autenticado.");
      return [];
    }
    Query paquetesQuery = FirebaseFirestore.instance
        .collection('paquetes')
        .where('destinatario', isEqualTo: user.uid);

    if (estado != null) {
      paquetesQuery = paquetesQuery.where('estado', isEqualTo: estado);
    }

    final QuerySnapshot paquetesSnapshot = await paquetesQuery.get();
    return paquetesSnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorColor: const Color(0xFFFF1E68),
            labelColor: const Color(0xFFFF1E68),
            unselectedLabelColor: Color(0xFFFF1E68),
            isScrollable: true,
            tabs: [
              Tab(text: 'Todos'),
              Tab(text: 'Completado'),
              Tab(text: 'En progreso'),
              Tab(text: 'Pendiente'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildPackageList(null),
            _buildPackageList('COMPLETADO'),
            _buildPackageList('EN PROGRESO'),
            _buildPackageList('PENDIENTE'),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageList(String? estado) {
    return FutureBuilder<List<DocumentSnapshot>>(
      future: _getPaquetes(estado: estado),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.isEmpty) {
          return const Center(child: Text("No se encontraron paquetes"));
        } else {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: snapshot.data!.map((paquete) {
              var paqueteData = paquete.data() as Map<String, dynamic>;
              return _buildPackageItem(
                paquete,
                isDelivered: paqueteData['estado'] == 'COMPLETADO',
                trackingNumber: paqueteData['tracking'] ?? 'N/A',
                status: paqueteData['estado'] ?? 'Estado desconocido',
                date: paqueteData['timestamp'] != null
                    ? DateFormat('dd/MM/yyyy')
                        .format(paqueteData['timestamp'].toDate())
                    : 'N/A',
              );
            }).toList(),
          );
        }
      },
    );
  }

  Widget _buildPackageItem(
    DocumentSnapshot paquete, {
    required bool isDelivered,
    required String trackingNumber,
    required String status,
    required String date,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.inventory_2_outlined,
            color: Colors.grey,
          ),
        ),
        title: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black),
            children: [
              const TextSpan(text: 'Tu paquete '),
              TextSpan(
                text: trackingNumber,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' $status'),
            ],
          ),
        ),
        subtitle: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: isDelivered
                    ? Colors.green.withOpacity(0.1)
                    : Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                isDelivered ? 'ENTREGADO' : 'EN PROGRESO',
                style: TextStyle(
                  color: isDelivered ? Colors.green : Colors.orange,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              date,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PackageDetailScreen(paquete: paquete),
            ),
          );
        },
      ),
    );
  }
}
