import 'package:flutter/material.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Número de tabs en el TabBar
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextButton(
                onPressed: () {},
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
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Todos'),
              Tab(text: 'Completado'),
              Tab(text: 'En progreso'),
              Tab(text: 'Pendiente'),
            ],
          ),
        ),
        body: Column(
          children: [
            // Package List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildPackageItem(
                    isDelivered: true,
                    trackingNumber: '#7XZ6V87Z6XCSA7',
                    status: 'ha sido entregado con éxito',
                    date: '24 May',
                  ),
                  _buildPackageItem(
                    isDelivered: false,
                    trackingNumber: '#7XZ6V87Z6XCSA7',
                    status: 'fue enviado a la ciudad de destino',
                    date: '24 May',
                  ),
                  _buildPackageItem(
                    isDelivered: false,
                    trackingNumber: '#7XZ6V87Z6XCSA7',
                    status: 'fue enviado a la ciudad de destino',
                    date: '24 May',
                  ),
                  _buildPackageItem(
                    isDelivered: false,
                    trackingNumber: '#7XZ6V87Z6XCSA7',
                    status: 'fue enviado a la ciudad de destino',
                    date: '24 May',
                  ),
                  _buildPackageItem(
                    isDelivered: true,
                    trackingNumber: '#7XZ6V87Z6XCSA7',
                    status: 'ha sido entregado con éxito',
                    date: '24 May',
                  ),
                  _buildPackageItem(
                    isDelivered: true,
                    trackingNumber: '#7XZ6V87Z6XCSA7',
                    status: 'ha sido entregado con éxito',
                    date: '24 May',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageItem({
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
      ),
    );
  }
}

Widget _buildPackageItem({
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
    ),
  );
}
