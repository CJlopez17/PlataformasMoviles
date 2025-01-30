import 'package:flutter/material.dart';

class Quote extends StatefulWidget {
  const Quote({super.key});

  @override
  State<Quote> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _valorDolaresController = TextEditingController();
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotizar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Destino
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 25, top: 5),
                child: Text('Destino',
                    style: TextStyle(color: Color(0xFF3F3F3F), fontSize: 20)),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Envio Desde',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
             Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Destino',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Color(0xFFFF1E68))),
              ),
            ),
          ),
          const SizedBox(
              height: 20,
            ),
            // Peso en libras
            _buildTextField(_pesoController, 'Peso aproximado en Lb'),
            const SizedBox(height: 20),

            // Categoría de importación
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
                  _buildCategoryButton("Impuesto específico"),
                  _buildCategoryButton("Categoría 4x4"),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 25, top: 5),
                child: Text('Productos',
                    style: TextStyle(color: Color(0xFF3F3F3F), fontSize: 20)),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 25, top: 5),
                child: Text('Selecciona el tipo de producto a importar',
                    style: TextStyle(color: Color(0xFF3F3F3F), fontSize: 15)),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: DropdownButtonFormField<String>(
                  //value: _selectedGender,
                  items: const [
                    DropdownMenuItem(
                      value: "Electrónico",
                      child: Text("Electrónico"),
                    ),
                    DropdownMenuItem(
                      value: "Ropa",
                      child: Text("Ropa"),
                    ),
                    DropdownMenuItem(
                      value: "Hogar",
                      child: Text("Hogar"),
                    ),
                    DropdownMenuItem(
                      value: "Accesorios",
                      child: Text("Accesorios"),
                    ),
                    DropdownMenuItem(
                      value: "Otros",
                      child: Text("Otros"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                    //  _selectedGender = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Color(0xFFFF1E68)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Color(0xFFFF1E68)),
                    ),
                  ),
                ),
          ),
          const SizedBox(height: 20,),
            // Precio unitario
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 25, top: 5),
                child: Text('Precio unitario',
                    style: TextStyle(color: Color(0xFF3F3F3F), fontSize: 20)),
              ),
            ),
            const SizedBox(height: 20),

            _buildTextField(_valorDolaresController, 'Valor en Dólares (US)'),
            const SizedBox(height: 20),

            // Botón de calcular
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: ElevatedButton(
                onPressed: _calcularImportacion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF1E68),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Calcular",
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
    );
  }

  /// Widget para los botones de categoría
  Widget _buildCategoryButton(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = category;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            category == _selectedCategory
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            size: 40,
            color: const Color(0xFFF23A90),
          ),
          const SizedBox(height: 8),
          Text(
            category,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF3F3F3F),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget para los campos de entrada
  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFFF1E68)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFFF1E68)),
          ),
        ),
      ),
    );
  }

  /// Método para calcular el costo de importación
  void _calcularImportacion() {
    if (_selectedCategory == null) {
      _showAlertDialog("Error", "Por favor, selecciona una categoría.");
      return;
    }

    double peso = double.tryParse(_pesoController.text) ?? 0;
    double valorDolares = double.tryParse(_valorDolaresController.text) ?? 0;
    double costoTotal = 0;

    if (_selectedCategory == "Categoría 4x4") {
      costoTotal = (peso * 11) + valorDolares;
    } else if (_selectedCategory == "Impuesto específico") {
      costoTotal = (valorDolares * 1.15) + (peso * 11);
    }

    _showAlertDialog(
        "Costo total de Importación", "\$${costoTotal.toStringAsFixed(2)}");
  }

  /// Método para mostrar un diálogo de alerta
  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message, style: const TextStyle(fontSize: 30, color: Color(0xFF000000)),),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Aceptar'),
              ),
            ),
          ],
        );
      },
    );
  }
}
