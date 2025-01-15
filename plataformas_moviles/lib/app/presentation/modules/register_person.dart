import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

// ignore: camel_case_types
class Register_Person extends StatefulWidget {
  const Register_Person({super.key});

  @override
  State<Register_Person> createState() => _Register_PersonState();
}

// ignore: camel_case_types
class _Register_PersonState extends State<Register_Person> {
  String? _selectedIdType;
  DateTime? _birthDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/logo1.png',
                  height: 200,
                ),
                const Text(
                  'REGISTRATE',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF1E68)),
                ),
                const SizedBox(height: 5),
                const Text(
                  'CAMPOS OBLIGATORIOS *',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3F3F3F)),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30, top: 5),
                    child: Text(
                      'Tipo de identificación *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                DropdownButtonFormField<String>(
                  value: _selectedIdType,
                  hint: const Text(
                    "Selecciona un tipo de identificación...",
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
                      _selectedIdType = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                const SizedBox(height: 13),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30, top: 5),
                    child: Text(
                      'NIT o Número de Identificación *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ej: 1234567890',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xFFFF1E68))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xFFFF1E68))),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30, top: 5),
                    child: Text(
                      'Nombres *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ej: Joseph',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xFFFF1E68))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xFFFF1E68))),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30, top: 5),
                    child: Text(
                      'Apellidos *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ej: López',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xFFFF1E68))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xFFFF1E68))),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30, top: 5),
                    child: Text(
                      'Email *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ej: example@example.com',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xFFFF1E68))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xFFFF1E68))),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30, top: 5),
                    child: Text(
                      'Email Alterno *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ej: example@example.com',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xFFFF1E68))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Color(0xFFFF1E68))),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30, top: 5),
                    child: Text(
                      'Contraseña *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      bool obscureText = true;
                      return TextField(
                        obscureText: obscureText, // Ocultar o mostrar texto
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Color(0xFFFF1E68)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Color(0xFFFF1E68)),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFFFF1E68),
                            ),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 13),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30, top: 5),
                    child: Text(
                      'Confirmar Contraseña *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      bool obscureText = true;
                      return TextField(
                        obscureText: obscureText, // Ocultar o mostrar texto
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Color(0xFFFF1E68)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Color(0xFFFF1E68)),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFFFF1E68),
                            ),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text('Fecha de Nacimiento',
                          style: TextStyle(
                              fontSize: 15, color: Color(0xFF3F3F3F))),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          DateTime? selectDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                        primary: Color(0xFFFF1E68),
                                        onPrimary: Colors.white,
                                        onSurface: Color(0xFF3F3F3F))),
                                child: child!,
                              );
                            },
                          );
                          if (selectDate != null) {
                            setState(() {
                              _birthDate = selectDate;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFFF1E68)),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _birthDate != null
                                    ? DateFormat('yyyy/MM/dd')
                                        .format(_birthDate!)
                                    : 'Selecciona tu fecha de nacimiento',
                                style: TextStyle(
                                  color: _birthDate != null
                                      ? Colors.black
                                      : Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              const Icon(Icons.calendar_today,
                                  color: Color(0xFFFF1E68)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_birthDate != null) {
                            // Procesar la fecha seleccionada
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Fecha de Nacimiento: ${DateFormat('yyyy/MM/dd').format(_birthDate!)}',
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Por favor, selecciona tu fecha de nacimiento.'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF1E68),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 50,
                          ),
                        ),
                        child: const Text(
                          'Registrar',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
