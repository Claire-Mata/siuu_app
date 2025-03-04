import 'package:flutter/material.dart'; // Importa el paquete de material design de Flutter.

class AppTheme { // Define la clase AppTheme para manejar la configuración del tema.
  static const Color primary = Color.fromARGB(204, 173, 32, 32); // Define un color primario con opacidad.

  // Define un tema claro que copia el tema ligero predeterminado y aplica personalizaciones.
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: const Color.fromARGB(255, 109, 40, 35), // Color primario personalizado para el tema claro.
      secondaryHeaderColor: const Color.fromARGB(255, 109, 40, 35), // Color de encabezado secundario.
      appBarTheme: const AppBarTheme(color: primary, elevation: 0)); // Personaliza el tema de la AppBar.
}

// Define un esquema de colores para el modo claro.
const lightColorScheme = ColorScheme(
    brightness: Brightness.light, // Indica que este es un esquema de color claro.
    primary: Color.fromARGB(255, 109, 40, 35), // Color primario del esquema.
    onPrimary: Color.fromARGB(255, 243, 218, 218), // Color utilizado en el texto sobre el color primario.
    secondary: Color.fromARGB(255, 230, 122, 114), // Color secundario del esquema.
    onSecondary: Color.fromARGB(255, 243, 218, 218), // Color para el texto sobre el color secundario.
    error: Color.fromARGB(255, 237, 184, 77), // Color utilizado para representar errores.
    onError: Color.fromARGB(255, 250, 243, 243), // Color para el texto sobre el color de error.
    // background: Color(0xFFFCFDF6), // Color de fondo (comentado).
    // onBackground: Color(0xFF1A1C18), // Color para el texto sobre el fondo (comentado).
    surface: Color(0xFFF9FAF3), // Color de la superficie.
    onSurface: Color(0xFF1A1C18)); // Color para el texto sobre la superficie.

const darkColorScheme = ColorScheme(
    brightness: Brightness.dark, // Indica que este es un esquema de color oscuro.
    primary: Color.fromARGB(255, 109, 40, 35), // Color primario del esquema (igual que el claro).
    onPrimary: Color.fromARGB(255, 243, 218, 218), // Color utilizado en el texto sobre el color primario (igual que el claro).
    secondary: Color.fromARGB(255, 230, 122, 114), // Color secundario del esquema (igual que el claro).
    onSecondary: Color.fromARGB(255, 243, 218, 218), // Color para el texto sobre el color secundario (igual que el claro).
    error: Color.fromARGB(255, 251, 248, 115), // Color utilizado para representar errores en modo oscuro.
    onError: Color.fromARGB(255, 250, 243, 243), // Color para el texto sobre el color de error (igual que el claro).
    // background: Color(0xFFFCFDF6), // Color de fondo (comentado).
    // onBackground: Color(0xFF1A1C18), // Color para el texto sobre el fondo (comentado).
    surface: Color(0xFFF9FAF3), // Color de la superficie (igual que el claro).
    onSurface: Color(0xFF1A1C18)); // Color para el texto sobre la superficie (igual que el claro).

// Define la configuración del tema en modo claro.
ThemeData lightMode = ThemeData(
  useMaterial3: true, // Habilita el uso de Material Design 3.
  brightness: Brightness.light, // Establece el brillo del tema a claro.
  colorScheme: lightColorScheme, // Aplica el esquema de colores claro.
  elevatedButtonTheme: ElevatedButtonThemeData( // Define el tema para botones elevados.
    style: ButtonStyle( // Establece el estilo del botón.
      backgroundColor: WidgetStateProperty.all<Color>( // Color de fondo del botón.
        const Color.fromARGB(
            255, 179, 100, 95), // Color de fondo ligeramente más oscuro para el botón.
      ),
      foregroundColor: // Color del texto del botón.
          WidgetStateProperty.all<Color>(Colors.white), // Color blanco para el texto.
      elevation: WidgetStateProperty.all<double>(5.0), // Establece la elevación (sombra) del botón.
      padding: WidgetStateProperty.all<EdgeInsets>( // Establece el padding del botón.
          const EdgeInsets.symmetric(horizontal: 20, vertical: 18)), // Padding horizontal y vertical.
      shape: WidgetStateProperty.all<RoundedRectangleBorder>( // Define la forma del botón.
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Ajusta el radio de las esquinas.
        ),
      ),
    ),
  ),
);

// Define la configuración del tema en modo oscuro.
ThemeData darkMode = ThemeData(
  useMaterial3: true, // Habilita el uso de Material Design 3.
  brightness: Brightness.dark, // Establece el brillo del tema a oscuro.
  colorScheme: darkColorScheme, // Aplica el esquema de colores oscuro.
);
