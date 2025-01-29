import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isEditing = false;
  final TextEditingController _idTypeController =
      TextEditingController(text: 'Personal');
  final List<String> _idTypePersonalOptions = [
    'Licencia de Conduccion',
    'TAX ID (Solo USA)',
    'Credencial de Elector',
    'RUC (Registro Unico de Contribuyentes)',
    'Cedula de Ciudadania',
    'Cedula de Extranjeria',
    'Pasaporte',
  ];
  String? _selectedIdTypePersonal;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _namesController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final List<String> _genderOptions = ['Masculino', 'Femenino'];
  String? _selectedGender;
  final List<String> _countryOptions = [
    'China',
    'Cuba',
    'Ecuador',
    'Estados Unidos',
    'RAE de Honk Kong (China)'
  ];
  String? _selectedCountry;
  final List<String> _stateOptions = ['Loja', 'Pichincha', 'Guayas'];
  String? _selectedState;
  final List<String> _cityOptions = [
    'Loja',
    'Catamayo',
    'Catacocha',
    'Alamor',
    'Alamuza',
    'Macará'
  ];
  String? _selectedCity;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final userData = userDoc.data();
    if (userData != null) {
      setState(() {
        _selectedIdTypePersonal = userData['idType'];
        _idController.text = userData['nit'];
        _namesController.text = userData['firstName'];
        _lastnameController.text = userData['lastName'];
        _selectedGender = userData['gender'];
        _selectedCountry = userData['idCountry'];
        _selectedState = userData['state'];
        _selectedCity = userData['city'];
        _addressController.text = userData['address'];
        _phoneController.text = userData['phone'];
        _emailController.text = userData['email'];
      });
    }
  }

  Future<void> _updateUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) return;

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'idType': _selectedIdTypePersonal,
      'idNumber': _idController.text,
      'names': _namesController.text,
      'lastname': _lastnameController.text,
      'gender': _selectedGender,
      'country': _selectedCountry,
      'state': _selectedState,
      'city': _selectedCity,
      'address': _addressController.text,
      'phone': _phoneController.text,
      'email': _emailController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/defaultUser.png'),
            ),
            const SizedBox(height: 15),
            Text(
              _namesController.text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              _lastnameController.text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildTextField(
              'Tipo de Cuenta',
              _idTypeController,
              alwaysReadOnly: true,
            ),
            const SizedBox(height: 20),
            _buildDropdownField(
              'Tipo de Identificación',
              _idTypePersonalOptions,
              _selectedIdTypePersonal,
              (value) {
                setState(() {
                  _selectedIdTypePersonal = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildTextField(
              'NIT o Número de cedula',
              _idController,
              alwaysReadOnly: false,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              'Nombres',
              _namesController,
              alwaysReadOnly: false,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              'Apellidos',
              _lastnameController,
              alwaysReadOnly: false,
            ),
            const SizedBox(height: 20),
            _buildDropdownField(
              'Género',
              _genderOptions,
              _selectedGender,
              (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildDropdownField(
              'País',
              _countryOptions,
              _selectedCountry,
              (value) {
                setState(() {
                  _selectedCountry = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildDropdownField(
              'Departamento / Estado',
              _stateOptions,
              _selectedState,
              (value) {
                setState(() {
                  _selectedState = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildDropdownField(
              'Ciudad',
              _cityOptions,
              _selectedCity,
              (value) {
                setState(() {
                  _selectedCity = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildTextField(
              'Dirección',
              _addressController,
              alwaysReadOnly: false,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              'Teléfono Celular',
              _phoneController,
              alwaysReadOnly: false,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              'Email',
              _emailController,
              alwaysReadOnly: false,
            ),
            const SizedBox(height: 20),

            // Botones
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_isEditing) {
                          await _updateUserData();
                        }
                        setState(() {
                          _isEditing = !_isEditing;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isEditing
                            ? const Color(0xFF7266BA)
                            : const Color(0xFFFE3791),
                        minimumSize: const Size(0, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        _isEditing ? 'Guardar' : 'Editar',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción para eliminar cuenta
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFECD1F),
                        minimumSize: const Size(0, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Eliminar Cuenta',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {required bool alwaysReadOnly}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            readOnly: alwaysReadOnly
                ? true
                : !_isEditing, // Siempre será de solo lectura si `alwaysReadOnly` es true
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.pink),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.pink),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.pink, width: 2),
              ),
              hintText: !_isEditing ? controller.text : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(
    String label,
    List<String> options,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: selectedValue,
            items: options
                .map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ))
                .toList(),
            onChanged: _isEditing
                ? onChanged
                : null, // Deshabilitar si no está en modo edición
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.pink),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.pink),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.pink, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
