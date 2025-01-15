import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class Register_Company extends StatefulWidget {
  const Register_Company({super.key});

  @override
  State<Register_Company> createState() => _Register_CompanyState();
}

// ignore: camel_case_types
class _Register_CompanyState extends State<Register_Company> {
  String? _selectedIdType;
  DateTime? _birthDate;
  String? _selectedIdCountry;
  String? _selectedState;
  String? _selectedCity;
  String? _selectedGender;
  bool _isChecked = false;
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
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(right: 30, top: 5),
                          child: Text(
                            'Fecha de Nacimiento *',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF3F3F3F)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 7),
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
                          padding: const EdgeInsets.symmetric(
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
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30, top: 5),
                    child: Text(
                      'Dirección *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
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
                      'País *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                DropdownButtonFormField<String>(
                  value: _selectedIdCountry,
                  hint: const Text(
                    "Selecciona un País...",
                    style: TextStyle(color: Colors.grey),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: "China",
                      child: Text("China"),
                    ),
                    DropdownMenuItem(
                      value: "Cuba",
                      child: Text("Cuba"),
                    ),
                    DropdownMenuItem(
                      value: "Ecuador",
                      child: Text("Ecuador"),
                    ),
                    DropdownMenuItem(
                      value: "Estados Unidos",
                      child: Text("Estados Unidos"),
                    ),
                    DropdownMenuItem(
                      value: "RAE de Honk Kong (China)",
                      child: Text("RAE de Honk Kong (China)"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedIdCountry = value;
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
                      'Departamento / Provincia / Estado *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                DropdownButtonFormField<String>(
                  value: _selectedState,
                  items: const [
                    DropdownMenuItem(
                      value: "Loja",
                      child: Text("Loja"),
                    ),
                    DropdownMenuItem(
                      value: "Pichincha",
                      child: Text("Pichincha"),
                    ),
                    DropdownMenuItem(
                      value: "Guayas",
                      child: Text("Guayas"),
                    ),
                    DropdownMenuItem(
                      value: "Chimborazo",
                      child: Text("Chimborazo"),
                    ),
                    DropdownMenuItem(
                      value: "Azuay",
                      child: Text("Azuay"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedState = value;
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
                      'Ciudad *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                DropdownButtonFormField<String>(
                  value: _selectedCity,
                  items: const [
                    DropdownMenuItem(
                      value: "Loja",
                      child: Text("Loja"),
                    ),
                    DropdownMenuItem(
                      value: "Catacocha",
                      child: Text("Catacocha"),
                    ),
                    DropdownMenuItem(
                      value: "Catamayo",
                      child: Text("Catamayo"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value;
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
                      'Barrio / Colonia *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
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
                      'Código Postal',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
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
                      'Teléfono celular *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '+593',
                      hintStyle: const TextStyle(color: Colors.black),
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
                      'Teléfono Fijo *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
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
                      'Genero *',
                      style: TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: const [
                    DropdownMenuItem(
                      value: "Hombre",
                      child: Text("Hombre"),
                    ),
                    DropdownMenuItem(
                      value: "Mujer",
                      child: Text("Mujer"),
                    ),
                    DropdownMenuItem(
                      value: "Problemas mentales",
                      child: Text("Problemas mentales"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
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
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      activeColor: const Color(0xFFFF1E68),
                    ),
                    const Text(
                      'Términos y Condiciones *',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF3F3F3F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _isChecked
                        ? () {
                            Navigator.pushNamed(context, '/button_panel');
                          }
                        : null, // Botón deshabilitado si el checkbox no está marcado
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF1E68),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Enviar Datos',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
