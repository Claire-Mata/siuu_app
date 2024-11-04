import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.

class AboutScreen extends StatelessWidget {
  // Clase AboutScreen, que extiende StatelessWidget, para mostrar información estática de la aplicación.
  const AboutScreen({super.key}); // Constructor de la clase, opcionalmente acepta una clave para identificar el widget.

  @override
  Widget build(BuildContext context) {
    // Método que construye la interfaz de la pantalla.
    return Scaffold(
      // Estructura principal de la pantalla, con AppBar y contenido en el cuerpo.
      appBar: AppBar(
        // Barra superior con título de la pantalla.
        title: const Text('Sobre Nosotros'), // Título mostrado en la AppBar.
      ),
      body: Padding(
        // Crea un margen interno alrededor del contenido del cuerpo.
        padding: const EdgeInsets.all(16.0), // Espaciado de 16 píxeles alrededor del contenido.
        child: Column(
          // Organiza los elementos de texto de arriba hacia abajo.
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido al inicio (izquierda).
          children: [
            // Lista de widgets hijos en la columna.
            const Text(
              'Bienvenido a nuestra aplicación', // Título de bienvenida.
              style: TextStyle(
                fontSize: 24, // Tamaño de fuente del texto.
                fontWeight: FontWeight.bold, // Aplica estilo de negrita.
              ),
            ),
            const SizedBox(height: 20), // Espacio de 20 píxeles entre elementos.
            const Text(
              // Texto descriptivo sobre la aplicación.
              'Nuestra aplicación está diseñada para facilitar la consulta de activos mediante escaneo de códigos de barras. '
              'Con un enfoque intuitivo y fácil de usar, podrás escanear, gestionar y analizar activos de '
              'manera eficiente y efectiva.',
              style: TextStyle(
                fontSize: 16, // Tamaño de fuente del texto descriptivo.
                height: 1.5, // Altura de línea para mejorar la legibilidad.
              ),
            ),
            const SizedBox(height: 20), // Espacio entre el párrafo y el título de características.
            const Text(
              'Características clave:', // Subtítulo para la lista de características.
              style: TextStyle(
                fontSize: 18, // Tamaño de fuente del subtítulo.
                fontWeight: FontWeight.bold, // Negrita para el subtítulo.
              ),
            ),
            const SizedBox(height: 10), // Espacio entre el subtítulo y la lista de características.
            const Text(
              // Lista de características de la aplicación.
              '- Escaneo rápido de códigos de barras\n'
              '- Consulta de inventario sencilla\n'
              '- Interfaz amigable y accesible',
              style: TextStyle(
                fontSize: 16, // Tamaño de fuente para la lista.
                height: 1.5, // Altura de línea para una mejor legibilidad.
              ),
            ),
            const SizedBox(height: 20), // Espacio entre la lista y el mensaje de cierre.
            const Text(
              // Mensaje final de la pantalla.
              '¡Esperamos que disfrutes usando nuestra aplicación',
              style: TextStyle(
                fontSize: 16, // Tamaño de fuente para el mensaje de cierre.
                height: 1.5, // Altura de línea.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
