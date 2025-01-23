import 'package:flutter/material.dart';

class Appearance extends StatefulWidget {
  const Appearance({super.key});

  @override
  State<Appearance> createState() => _AppearanceState();
}

class _AppearanceState extends State<Appearance> {
  int _selectedOption = 0;

  void _updateSelection(int index) {
    setState(() {
      _selectedOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apariencia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Apariencia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(8),
                borderColor: Colors.grey,
                selectedBorderColor: const Color(0xFFFE3791),
                selectedColor: Colors.white,
                fillColor: const Color(0xFFFE3791),
                isSelected: [
                  _selectedOption == 0,
                  _selectedOption == 1,
                  _selectedOption == 2,
                ],
                onPressed: _updateSelection,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Sistema'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Claro'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Oscuro'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Seleccionado: ${_selectedOption == 0 ? "Sistema" : _selectedOption == 1 ? "Claro" : "Oscuro"}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
