import 'package:flutter/material.dart';

class AddressFormat extends StatefulWidget {
  const AddressFormat({super.key});

  @override
  State<AddressFormat> createState() => _AddressFormatState();
}

class _AddressFormatState extends State<AddressFormat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dirección de Casillero'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 10),
            const Text(
              '¿Como configurar la dirección?',
              style: TextStyle(fontSize: 25, color: Color(0xFF7266BA)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tu dirección de 1800Cargo para tus compras es:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Camilo Jose Godoy Martinez ECCAM002\n'
              '7227 NW 88TH AVE, TAMARAC\n'
              'FL 33321\n'
              '+ 57 312 2975120',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Y así, debes agregar tu dirección al comprar:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF6F42C1),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _buildInputField(
              title: 'En el campo de FIRST NAME:',
              value: 'Tu 1er nombre + tu 2do nombre',
            ),
            _buildInputField(
              title: 'En el campo de LAST NAME: ',
              value: 'Tu 1er apellido + tu 2do apellido + tu Nro de casillero',
            ),
            _buildInputField(
              title: 'En el campo de STREET ADDRESS:',
              value: '7227 NW 88TH AVE',
            ),
            _buildInputField(
              title: 'En el campo de CITY:',
              value: 'TAMARAC',
            ),
            _buildInputField(
              title: 'En el campo de STATE:',
              value: 'FLORIDA',
            ),
            _buildInputField(
              title: 'En el campo de ZIP CODE:',
              value: '33321',
            ),
            _buildInputField(
              title: 'En el campo de TELEPHONE: ',
              value: '+ 57 312 2975120',
            ),
            const SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }

  Widget _buildInputField({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFC0CB), // Rosado
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
