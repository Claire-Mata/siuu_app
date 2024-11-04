import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:siiu/screens/screens.dart'; // Importa las pantallas de la aplicación desde un módulo específico.
import 'package:siiu/theme/app_theme.dart'; // Importa el tema de la aplicación para utilizar colores y estilos.
import 'package:siiu/widgets/widgets.dart'; // Importa widgets personalizados de la aplicación.

class WelcomeScreen extends StatelessWidget { // Define la clase WelcomeScreen como un widget sin estado.
  const WelcomeScreen({super.key}); // Constructor que permite pasar una clave opcional.

  @override
  Widget build(BuildContext context) { // Método que construye la interfaz de usuario.
    return CustomScaffold( // Utiliza un scaffold personalizado para la estructura básica de la pantalla.
      child: Column( // Organiza los widgets hijos en una columna.
        children: [
          Flexible( // Utiliza Flexible para adaptar el tamaño del widget hijo.
            flex: 8, // Este hijo ocupará 8 partes del espacio disponible.
            child: Center( // Centra el widget hijo dentro del espacio disponible.
              child: RichText( // Utiliza RichText para permitir múltiples estilos de texto en un solo widget.
                textAlign: TextAlign.center, // Alinea el texto al centro.
                text: const TextSpan(children: [ // Define los diferentes spans de texto.
                  TextSpan(
                      text: "!Bienvenido!\n", // Texto de bienvenida.
                      style: TextStyle( // Estilo del primer span de texto.
                        fontSize: 45.0, // Tamaño de fuente.
                        fontWeight: FontWeight.w600, // Grosor de la fuente.
                      )),
                  TextSpan(
                      text: '\nhacia la libertad por la cultura', // Texto adicional.
                      style: TextStyle(
                        fontSize: 20, // Tamaño de fuente del segundo span.
                      ))
                ]),
              ),
            ),
          ),
          Flexible( // Utiliza Flexible nuevamente para adaptar el tamaño del siguiente widget hijo.
            flex: 1, // Este hijo ocupará 1 parte del espacio disponible.
            child: Align( // Alinea el widget hijo según la alineación especificada.
              alignment: Alignment.bottomRight, // Alinea el contenido al borde inferior derecho.
              child: Row( // Organiza los widgets hijos en una fila.
                children: [
                  const Expanded( // Expande el primer botón para ocupar el espacio disponible.
                    child: WelcomeButton( // Botón de bienvenida para "sobre nosotros".
                      buttonText: "sobre nosotros", // Texto del botón.
                      onTap: AboutScreen(), // Pantalla que se abrirá al tocar el botón.
                      color: Colors.transparent, // Color de fondo transparente.
                      textColor: Colors.white, // Color del texto en blanco.
                    ),
                  ),
                  Expanded( // Expande el segundo botón para ocupar el espacio disponible.
                    child: WelcomeButton( // Botón de bienvenida para "ingresar".
                      buttonText: "ingresar ", // Texto del botón.
                      onTap: const SplashScreen(screen: SignInScreen()), // Pantalla que se abrirá al tocar el botón.
                      color: Colors.white, // Color de fondo blanco.
                      textColor: lightColorScheme.primary, // Color del texto utilizando el esquema de color de la aplicación.
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
