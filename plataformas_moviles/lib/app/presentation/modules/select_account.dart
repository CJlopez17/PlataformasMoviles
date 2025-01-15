import 'package:flutter/material.dart';

class SelectAccount extends StatefulWidget {
  const SelectAccount({super.key});

  @override
  State<SelectAccount> createState() => SelectAccountState();
}

class SelectAccountState extends State<SelectAccount> {
  String? _selectedAccountType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(
                'assets/images/logo1.png', // Reemplaza con la ruta de tu imagen en los assets
                height: 200),
            const Text(
              "ELIGE TU TIPO DE CUENTA",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF1E68),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            DropdownButtonFormField<String>(
              value: _selectedAccountType,
              hint: const Text(
                "Selecciona un tipo de cuenta...",
                style: TextStyle(color: Colors.grey),
              ),
              items: const [
                DropdownMenuItem(
                  value: "Personal",
                  child: Text("Personal"),
                ),
                DropdownMenuItem(
                  value: "Empresarial",
                  child: Text("Empresarial"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedAccountType = value;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  if (_selectedAccountType != null) {
                    if (_selectedAccountType == 'Personal') {
                      Navigator.pushNamed(context, '/register_person');
                    } else if (_selectedAccountType == 'Empresarial') {
                      Navigator.pushNamed(context, '/register_company');
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Por favor, selecciona un tipo de cuenta.',
                            style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Color(0xFF3F3F3F)))));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF1E68),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50)),
                child: const Text(
                  'Siguiente',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
