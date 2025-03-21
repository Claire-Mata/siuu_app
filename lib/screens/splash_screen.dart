import 'package:animated_splash_screen/animated_splash_screen.dart'; // Importa el paquete para la pantalla de inicio animada.
import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.

class SplashScreen extends StatelessWidget { // Define la clase SplashScreen como un widget sin estado.
  const SplashScreen({super.key, required this.screen}); // Constructor que acepta un parámetro requerido 'screen'.
  
  final Widget? screen; // Declara una variable que almacenará la siguiente pantalla a mostrar.

  @override
  Widget build(BuildContext context) { // Método que construye la interfaz de usuario.
    return AnimatedSplashScreen( // Retorna un widget AnimatedSplashScreen.
      splash: 'assets/siuu.png', // Especifica la imagen que se mostrará durante el splash.
      nextScreen: screen!, // Especifica la pantalla siguiente que se mostrará después del splash (asegura que 'screen' no es nulo).
      splashTransition: SplashTransition.fadeTransition, // Define la transición de animación del splash.
      splashIconSize: 200, // Establece el tamaño del ícono de splash.
      backgroundColor: const Color.fromARGB(255, 163, 4, 4), // Establece el color de fondo de la pantalla de inicio.
    );
  }
}
