import 'package:flutter/material.dart'; // Importando el paquete principal de Flutter para construir interfaces de usuario.
import 'package:hive_flutter/hive_flutter.dart'; // Importando Hive Flutter para el uso de la base de datos local.
import 'package:siiu/screens/screens.dart'; // Importando las pantallas personalizadas de la aplicación.
import 'package:siiu/theme/app_theme.dart'; // Importando el tema personalizado de la aplicación.
void main() async {
  // Punto de entrada principal de la aplicación.
  // Asegurando que los elementos vinculados a Flutter estén inicializados antes de usar widgets o plugins.
  WidgetsFlutterBinding.ensureInitialized(); 
  // Inicializando Hive para que funcione correctamente con Flutter.
  await Hive.initFlutter(); 
  // Inicia la aplicación llamando a MyApp.
  runApp(const MyApp());
}
// Clase principal de la aplicación que extiende StatelessWidget, lo cual significa que no guarda estado interno.
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor de la clase, opcionalmente acepta una clave para identificar el widget.
  @override
  Widget build(BuildContext context) {
    // Construye el widget MaterialApp que configura y envuelve toda la aplicación.
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la bandera de depuración en la esquina superior derecha.
      title: 'SIIU', // Define el título de la aplicación.

      // Define la ruta de inicio de la aplicación.
      initialRoute: 'welcome',

      // Mapa de rutas que define a qué widget debe ir cada nombre de ruta.
      routes: {
        'AboutScreen': (context) => const AboutScreen(), // Ruta para ir a la pantalla de "Sobre Nosotros".
        'welcome': (context) => const WelcomeScreen(), // Ruta para ir a la pantalla de bienvenida.
      },
      
      theme: lightMode, // Aplica el tema personalizado a la aplicación.
    );
  }
}
