import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plataformas_moviles/services/auth_service.dart';

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
  String? _selectedIdCountry;
  String? _selectedState;
  String? _selectedCity;
  String? _selectedGender;
  bool _isChecked = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _landlineController = TextEditingController();
  final TextEditingController _nitController = TextEditingController();
  final TextEditingController _alternateEmailController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();

  final AuthService _authService = AuthService();

  Future<void> _registerUser() async {
    if (_isChecked) {
      // Validaciones de campos vacíos
      if (_emailController.text.isEmpty ||
          _passwordController.text.isEmpty ||
          _firstNameController.text.isEmpty ||
          _lastNameController.text.isEmpty ||
          _selectedIdCountry == null ||
          _selectedState == null ||
          _selectedCity == null ||
          _birthDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text("Por favor, complete todos los campos obligatorios.")),
        );
        return;
      }

      // Validación de coincidencia de contraseñas
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Las contraseñas no coinciden.")),
        );
        return;
      }

      try {
        // Registro del usuario
        User? user = await _authService.registerWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );

        if (user != null) {
          // Guardar los datos del usuario en Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
            'idType': _selectedIdType ?? '',
            'nit': _nitController.text,
            'birthDate':
                _birthDate != null ? Timestamp.fromDate(_birthDate!) : null,
            'idCountry': _selectedIdCountry ?? '',
            'state': _selectedState ?? '',
            'city': _selectedCity ?? '',
            'gender': _selectedGender ?? '',
            'firstName': _firstNameController.text,
            'lastName': _lastNameController.text,
            'email': _emailController.text,
            'alternateEmail': _alternateEmailController.text,
            'address': _addressController.text,
            'phone': _phoneController.text,
            'postalCode': _postalCodeController.text,
            'landline': _landlineController.text,
            'createdAt': Timestamp.now(),
          });

          // Limpiar los campos después del registro
          setState(() {
            _selectedIdType = null;
            _selectedIdCountry = null;
            _selectedState = null;
            _selectedCity = null;
            _selectedGender = null;
            _birthDate = null;
            _emailController.clear();
            _passwordController.clear();
            _firstNameController.clear();
            _lastNameController.clear();
            _addressController.clear();
            _phoneController.clear();
            _landlineController.clear();
            _nitController.clear();
            _alternateEmailController.clear();
            _confirmPasswordController.clear();
            _postalCodeController.clear();
            _birthDateController.clear();
            _neighborhoodController.clear();
          });

          Navigator.pushNamed(context, '/button_panel');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Debes aceptar los términos y condiciones.')),
      );
    }
  }

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
                value: _selectedIdType != null ? _selectedIdType : null,
                hint: const Text(
                  "Selecciona un tipo de identificación...",
                  style: TextStyle(color: Colors.grey),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Licencia de Conduccion",
                    child: Text("Licencia de Conduccion"),
                  ),
                  DropdownMenuItem(
                    value: "TAX ID (Solo USA)",
                    child: Text("TAX ID (Solo USA)"),
                  ),
                  DropdownMenuItem(
                    value: "State ID (Identificacion del Estado, Solo USA)",
                    child: Text(
                      "State ID (Identificacion del Estado, Solo USA)",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Credencial de Elector",
                    child: Text("Credencial de Elector"),
                  ),
                  DropdownMenuItem(
                    value: "RUC (Registro Unico de Contribuyentes)",
                    child: Text("RUC (Registro Unico de Contribuyentes)"),
                  ),
                  DropdownMenuItem(
                    value: "Cedula de Ciudadania",
                    child: Text("Cedula de Ciudadania"),
                  ),
                  DropdownMenuItem(
                    value: "Cedula de Extranjeria",
                    child: Text("Cedula de Extranjeria"),
                  ),
                  DropdownMenuItem(
                    value: "Pasaporte",
                    child: Text("Pasaporte"),
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedIdType = value;
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

              // **********************************************************
              // CAMPO NUMERO DE IDENTIFICACION
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
                  controller: _nitController,
                  decoration: InputDecoration(
                    hintText: 'Ej: 1234567890',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                  ),
                ),
              ),

              // **********************************************************
              // CAMPO NOMBRES
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
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    hintText: 'Ej: Joseph',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                  ),
                ),
              ),

              // **********************************************************
              // CAMPO APELLIDOS
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
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    hintText: 'Ej: López',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                  ),
                ),
              ),

              // **********************************************************
              // CAMPO EMAIL
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
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Ej: example@example.com',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                  ),
                ),
              ),

              // **********************************************************
              // CAMPO EMAIL ALTERNO
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
                  controller: _alternateEmailController,
                  decoration: InputDecoration(
                    hintText: 'Ej: example@example.com',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                  ),
                ),
              ),

              // **********************************************************
              // CAMPO CONTRASEÑA
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
                      controller: _passwordController,
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

              // **********************************************************
              // CAMPO CONFIRMAR CONTRASEÑA
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
                      controller: _confirmPasswordController,
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

              // **********************************************************
              // CAMPO FECHA NACIMIENTO
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
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFF3F3F3F)),
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
                                  onSurface: Color(0xFF3F3F3F),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (selectDate != null) {
                          setState(() {
                            _birthDate = selectDate;
                            _birthDateController.text =
                                DateFormat('yyyy/MM/dd').format(selectDate);
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFFF1E68)),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _birthDate != null
                                  ? DateFormat('yyyy/MM/dd').format(_birthDate!)
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

              // **********************************************************
              // CAMPO DIRECCION
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
                  controller: _addressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                  ),
                ),
              ),

              // **********************************************************
              // CAMPO PAIS
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

              // **********************************************************
              // CAMPO DEPARTAMENTO PROVINCIA ESTADO
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
                  controller: _neighborhoodController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                  ),
                ),
              ),

              // **********************************************************
              // CODIGO POSTAL
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
                  controller: _postalCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                  ),
                ),
              ),

              // **********************************************************
              // CAMPO TELEFONO CELULAR
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
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: '+593',
                    hintStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                  ),
                ),
              ),

              // **********************************************************
              // CAMPO TELEFNON FJO
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
                  controller: _landlineController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                  ),
                ),
              ),

              // **********************************************************
              // CAMPO GENERO
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
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
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
                          // Llamamos a la función que maneja el registro
                          _registerUser(); // Registra al usuario
                        }
                      : null,
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
      ),
    );
  }
}
