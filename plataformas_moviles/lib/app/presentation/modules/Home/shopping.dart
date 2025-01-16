import 'package:flutter/material.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize
                    .min, // Asegura que el Row ocupe solo el espacio necesario
                children: [
                  // Espacio entre la imagen y el texto
                  const Text(
                    'Camilo Godoy',
                    style: TextStyle(
                      color: Color(0xFF3F3F3F),
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    'assets/images/persona.png',
                    height: 30, // Ajusta el tamaño de la imagen si es necesario
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 27,
                    color: Color(0xFF3F3F3F),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}