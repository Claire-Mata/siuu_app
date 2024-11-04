import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Importa el paquete para la barra de navegación curva.
import 'package:flutter/material.dart'; // Importa el paquete de material design de Flutter.
import 'package:siuu_app/screens/screens.dart'; // Importa las pantallas que se utilizarán en la navegación.

class NavBar extends StatefulWidget { // Define una clase NavBar que extiende StatefulWidget.
  const NavBar({super.key}); // Constructor que permite pasar una clave.

  @override
  State<NavBar> createState() => _NavBarState(); // Crea y devuelve el estado correspondiente a NavBar.
}

class _NavBarState extends State<NavBar> { // Clase que maneja el estado del NavBar.
  int _intpage = 0; // Variable que almacena el índice de la página actual.
  // Método para navegar a la página seleccionada desde la barra de navegación.
  void _navigateBottonBar(int index) {
    setState(() { // Actualiza el estado del widget.
      _intpage = index; // Cambia el índice de la página actual al índice seleccionado.
    });
  }
  // Lista de widgets (pantallas) que se mostrarán según la selección en la barra de navegación.
  final List<Widget> _pages = [
    const ListView1Screen(), // Primera pantalla de la lista.
    const ScannerScreen(), // Segunda pantalla (escáner).
  ];
  final GlobalKey<CurvedNavigationBarState> _curvednavigationkey = GlobalKey(); // Clave global para la barra de navegación curva.
  @override
  Widget build(BuildContext context) { // Método que construye la interfaz del widget.
    return Scaffold( // Devuelve un widget Scaffold para la estructura básica de la interfaz.
      extendBody: true, // Permite que el cuerpo del Scaffold se extienda más allá de los límites de la barra de navegación.
      body: _pages[_intpage], // Muestra la página correspondiente al índice actual.
      backgroundColor: Colors.transparent, // Establece el color de fondo del Scaffold como transparente.
      bottomNavigationBar: CurvedNavigationBar( // Define la barra de navegación curva.
        key: _curvednavigationkey, // Asocia la clave global a la barra de navegación.
        index: 0, // Establece el índice inicial de la barra de navegación.
        height: 65.0, // Altura de la barra de navegación.
        items: const [ // Lista de íconos que se mostrarán en la barra de navegación.
          Icon(
            Icons.assignment, // Ícono para la primera opción.
            color: Colors.white, // Color del ícono.
          ),
          Icon(
            Icons.camera, // Ícono para la segunda opción.
            color: Colors.white, // Color del ícono.
          ),
        ],
        backgroundColor: const Color.fromARGB(0, 136, 49, 49), // Color de fondo de la barra de navegación (transparente).
        buttonBackgroundColor: const Color.fromARGB(212, 247, 95, 95), // Color de fondo de los botones de la barra de navegación.
        color: const Color.fromARGB(255, 84, 49, 47), // Color de la barra de navegación.
        animationDuration: const Duration(milliseconds: 600), // Duración de la animación al cambiar de página.
        animationCurve: Curves.easeInOut, // Curva de la animación al cambiar de página.
        onTap: _navigateBottonBar, // Llama al método _navigateBottonBar cuando se toca un ícono.

        // letIndexChange: (index) => true, // Permite que se cambie el índice (comentado).
      ),
    );
  }
}
