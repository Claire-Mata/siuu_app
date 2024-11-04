import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre Nosotros'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaciado alrededor del contenido
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinear el texto a la izquierda
          children: [
            const Text(
              'Bienvenido a nuestra aplicación',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nuestra aplicación está diseñada para facilitar la consulta de activos mediante escaneo de códigos de barras. '
              'Con un enfoque intuitivo y fácil de usar, podrás escanear, gestionar y analizar activos de '
              'manera eficiente y efectiva.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5, // Espaciado entre líneas
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Características clave:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '- Escaneo rápido de códigos de barras\n'
              '- Consulta de inventario sencilla\n'
              '- Interfaz amigable y accesible',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '¡Esperamos que disfrutes usando nuestra aplicación ',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
