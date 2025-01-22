import 'package:flutter/material.dart';
import 'package:plataformas_moviles/app/routes/app_routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Image.asset('assets/images/logo1.png', height: 200, /*width: 500*/),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'INICIAR SESIÓN',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF1E68)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.email, color: Color(0xFF3F3F3F)),
                      hintText: 'Correo electrónico',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Color(0xFFFF1E68))),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: StatefulBuilder(
                    builder: (context, setState) {
                      bool _obscureText =
                          true; // Estado inicial para ocultar el texto
      
                      return TextField(
                        obscureText: _obscureText, // Ocultar o mostrar texto
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.lock, color: Color(0xFFFF1E68)),
                          hintText: 'Contraseña',
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
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFFFF1E68),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30, top: 5),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Se te olvido la contraseña?',
                          style:
                              TextStyle(color: Color(0xFFFF1E68), fontSize: 14)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.pushNamed(context, '/button_panel');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF1E68),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Iniciar sesión",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook, size: 35),
                          color: const Color(0xFF3F3F3F),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.apple, size: 35),
                          color: const Color(0xFF3F3F3F),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.g_mobiledata, size: 35),
                          color: const Color(0xFF3F3F3F),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.close, size: 35),
                          color: const Color(0xFF3F3F3F),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('No tienes una cuenta?'),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.selectAccount);
                          },
                          child: const Text(
                            'Regístrate',
                            style: TextStyle(
                                color: Color(0xFF0000FF),
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ))
    );
  }
}
