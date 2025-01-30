import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Locker extends StatefulWidget {
  const Locker({super.key});

  @override
  State<Locker> createState() => _LockerState();
}

class _LockerState extends State<Locker> {
  int _selectedIndex = 0;
  late YoutubePlayerController _youtubeController;

  final List<String> _locations = ["Miami", "Bogotá", "Quito"];
  final Map<String, Map<String, String>> _locationData = {
    "Miami": {
      "estado": "Florida",
      "ciudad": "Doral",
      "codigoPostal": "33172-2177"
    },
    "Bogotá": {
      "estado": "Cundinamarca",
      "ciudad": "Bogotá",
      "codigoPostal": "110111"
    },
    "Quito": {
      "estado": "Pichincha",
      "ciudad": "Quito",
      "codigoPostal": "170515"
    },
  };

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'Cwk_hXRs2cg', // ID del video de YouTube
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  Future<Map<String, String>> _getUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (snapshot.exists) {
        final firstName = snapshot['firstName'] ?? 'Usuario';
        final lastName = snapshot['lastName'] ?? '';
        return {"firstName": firstName, "lastName": lastName};
      }
    }
    return {"firstName": "Usuario", "lastName": ""};
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _locations.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CASILLERO"),
          bottom: TabBar(
            indicatorColor: const Color(0xFFFF1E68),
            labelColor: const Color(0xFFFF1E68),
            unselectedLabelColor: Color(0xFFFF1E68),
            tabs: _locations.map((location) => Tab(text: location)).toList(),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<Map<String, String>>(
                future: _getUserName(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Text("Error al cargar los datos"));
                  } else {
                    final firstName = snapshot.data!['firstName'] ?? 'Usuario';
                    final lastName = snapshot.data!['lastName'] ?? '';

                    return Center(
                      // Centra el Card en la pantalla
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Ajusta el tamaño del Card al contenido
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$firstName $lastName",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                _locations[_selectedIndex],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Icon(Icons.location_on,
                                      color: Colors.blue),
                                  const SizedBox(width: 8),
                                  Text(
                                      "Estado: ${_locationData[_locations[_selectedIndex]]!["estado"]}"),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.location_city,
                                      color: Colors.green),
                                  const SizedBox(width: 8),
                                  Text(
                                      "Ciudad: ${_locationData[_locations[_selectedIndex]]!["ciudad"]}"),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.pin, color: Colors.red),
                                  const SizedBox(width: 8),
                                  Text(
                                      "Código Postal: ${_locationData[_locations[_selectedIndex]]!["codigoPostal"]}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "¡APRENDE A INGRESAR TU CASILLERO!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              YoutubePlayer(
                controller: _youtubeController,
                showVideoProgressIndicator: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
