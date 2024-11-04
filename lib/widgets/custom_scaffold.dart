import 'package:flutter/material.dart'; // Importa el paquete de material design de Flutter.

class CustomScaffold extends StatelessWidget { // Define una clase CustomScaffold que extiende StatelessWidget.
  const CustomScaffold({super.key, this.child}); // Constructor que recibe un widget opcional 'child'.
  final Widget? child; // Propiedad para almacenar el widget hijo.

  @override
  Widget build(BuildContext context) { // Método que construye la interfaz del widget.
    return Scaffold( // Devuelve un widget Scaffold que proporciona la estructura básica de la aplicación.
      appBar: AppBar( // Define la barra de la aplicación (AppBar).
        iconTheme: const IconThemeData(color: Colors.white), // Establece el color de los iconos en la AppBar a blanco.
        title: const Text(' '), // Título vacío para la AppBar.
        backgroundColor: Colors.transparent, // Establece el color de fondo de la AppBar a transparente.
        elevation: 0, // Establece la elevación de la AppBar a 0 (sin sombra).
      ),
      extendBodyBehindAppBar: true, // Permite que el cuerpo del Scaffold se extienda detrás de la AppBar.
      extendBody: true, // Permite que el cuerpo del Scaffold ocupe todo el espacio disponible.

      body: Stack( // Utiliza un Stack para superponer varios widgets.
        children: [
          Image.asset( // Agrega una imagen de fondo.
            'assets/fondo.jpg', // Ruta de la imagen en los activos de la aplicación.
            fit: BoxFit.cover, // Ajusta la imagen para cubrir todo el área disponible.
            width: double.infinity, // Ancho máximo para ocupar todo el espacio disponible.
            height: double.infinity, // Altura máxima para ocupar todo el espacio disponible.
          ),
          SafeArea( // Asegura que el contenido no se superponga a áreas sensibles (como el notch o la barra de estado).
            child: child!, // Muestra el widget hijo proporcionado al CustomScaffold.
          ),
          // Expanded(child: NavBar()), // Comentado: se puede agregar un Navbar expandido aquí si se desea.
        ],
      ),
      // bottomNavigationBar: const NavBar(), // Comentado: se puede agregar un bottom navigation bar si se desea.
    );
  }
}
