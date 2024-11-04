import 'package:flutter/material.dart'; // Importa el paquete de Flutter para utilizar Material Design.

class WelcomeButton extends StatelessWidget { // Define un widget Stateless llamado WelcomeButton.
  const WelcomeButton(
      {super.key, this.buttonText, this.onTap, this.color, this.textColor}); // Constructor que recibe parámetros opcionales para personalizar el botón.
  
  final String? buttonText; // Texto que se mostrará en el botón.
  final Widget? onTap; // Widget al que navegará al hacer clic en el botón.
  final Color? color; // Color de fondo del botón.
  final Color? textColor; // Color del texto del botón.
  
  @override
  Widget build(BuildContext context) { // Método que construye la interfaz del widget.
    return GestureDetector( // Widget que detecta gestos, como toques.
      onTap: () { // Acción que se ejecuta cuando se toca el botón.
        Navigator.push( // Navega a una nueva pantalla.
          context, // Contexto actual de la aplicación.
          MaterialPageRoute( // Crea una ruta de material.
            builder: (e) => onTap!, // Construye la nueva pantalla usando el widget onTap.
          ),
        );
      },
      child: Container( // Contenedor que representa el botón.
        padding: const EdgeInsets.all(30.0), // Espaciado interno del botón.
        decoration: BoxDecoration( // Estilo de decoración del botón.
            color: color!, // Color de fondo del botón.
            //color: Colors.white, // Color opcional, comentado.
            borderRadius: const BorderRadius.only( // Radio de esquinas del botón.
              topLeft: Radius.circular(50), // Esquina superior izquierda con radio de 50.
            )),
        child: Text( // Widget de texto que muestra el texto del botón.
          buttonText!, // Texto a mostrar en el botón.
          textAlign: TextAlign.center, // Alineación del texto en el centro.
          style: TextStyle( // Estilo del texto.
            fontSize: 20.0, // Tamaño de la fuente.
            fontWeight: FontWeight.bold, // Peso de la fuente (negrita).
            color: textColor!, // Color del texto.
          ),
        ),
      ),
    );
  }
}
