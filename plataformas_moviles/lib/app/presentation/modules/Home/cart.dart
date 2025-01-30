import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plataformas_moviles/app/presentation/modules/Home/home.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final _formKey = GlobalKey<FormState>();
  String tienda = "";
  String contenido = "Electrónicos";
  double valorComercial = 0;
  double valorAsegurado = 0;
  String facturaReferencia = "";

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      String tracking =
          FirebaseFirestore.instance.collection('paquetes').doc().id;

      // Se agrega el campo fecha_subida con el valor de la fecha y hora actual
      await FirebaseFirestore.instance
          .collection('paquetes')
          .doc(tracking)
          .set({
        'tracking': tracking,
        'tienda': tienda,
        'contenido': contenido,
        'destinatario': user.uid,
        'valor_comercial': valorComercial,
        'valor_asegurado': valorAsegurado,
        'factura_referencia': facturaReferencia,
        'estado': 'PENDIENTE', // Estado agregado
        'fecha_subida':
            FieldValue.serverTimestamp(), // Fecha y hora de la subida
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Paquete registrado con éxito")));

      // Redirigir a la pantalla de inicio después de registrar el paquete
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const Home()), // Ajusta según el nombre de tu pantalla Home
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrar Paquete")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildInputField(
                  "Tienda", "Ej: Amazon", (value) => tienda = value!),
              _buildDropdownField(),
              _buildInputField("Valor Comercial (USD)", "Ej: 100",
                  (value) => valorComercial = double.parse(value!)),
              _buildInputField("Valor Asegurado (USD)", "Ej: 50",
                  (value) => valorAsegurado = double.parse(value ?? "0")),
              _buildInputField("Número o Referencia de Factura",
                  "Ej: INV123456", (value) => facturaReferencia = value!),
              SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF1E68), // Color primario
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    minimumSize: const Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Subir Paquete",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, Function(String?) onSave) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Color(0xFFFF1E68)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Color(0xFFFF1E68)),
          ),
        ),
        validator: (value) => value!.isEmpty ? "Campo obligatorio" : null,
        onSaved: onSave,
      ),
    );
  }

  Widget _buildDropdownField() {
    List<String> categorias = [
      "Electrónicos",
      "Ropa",
      "Hogar",
      "Accesorios",
      "Otros"
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: "Contenido",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Color(0xFFFF1E68)),
          ),
        ),
        value: contenido,
        onChanged: (newValue) => setState(() => contenido = newValue!),
        items: categorias.map((categoria) {
          return DropdownMenuItem(
            value: categoria,
            child: Text(categoria),
          );
        }).toList(),
      ),
    );
  }
}
