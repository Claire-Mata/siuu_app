import 'package:flutter/material.dart'; // Importa el paquete principal de Flutter para construir la interfaz de usuario.
import 'package:siuu_app/theme/app_theme.dart'; // Importa el tema de la aplicación definido en otro archivo.
import 'package:siuu_app/widgets/widgets.dart'; // Importa widgets personalizados de la aplicación.
import 'package:siuu_app/services/api_services.dart'; // Importa el servicio para realizar llamadas a la API.

class SignInScreen extends StatefulWidget {
  // Clase que representa la pantalla de inicio de sesión.
  const SignInScreen({super.key}); // Constructor que permite pasar una clave opcional.

  @override
  State<SignInScreen> createState() => _SignInScreenState();
  // Crea el estado mutable para este widget.
}

class _SignInScreenState extends State<SignInScreen> {
  // Clase de estado que controla el comportamiento y la apariencia de SignInScreen.
  final _formSignInKey = GlobalKey<FormState>(); // Clave global para el formulario de inicio de sesión.
  final TextEditingController _emailController = TextEditingController(); // Controlador para el campo de correo electrónico.
  final TextEditingController _passwordController = TextEditingController(); // Controlador para el campo de contraseña.
  final ApiService _apiService = ApiService(); // Instancia del servicio para manejar la API.
  bool agreePersonalData = true; // Variable para controlar el acuerdo de datos personales.

  @override
  void dispose() {
    // Método que se llama cuando el widget se elimina del árbol de widgets.
    _emailController.dispose(); // Libera los recursos del controlador de correo electrónico.
    _passwordController.dispose(); // Libera los recursos del controlador de contraseña.
    super.dispose(); // Llama al método dispose de la clase base.
  }

  // Método para iniciar sesión
  Future<void> _signIn() async {
    // Función asíncrona que intenta iniciar sesión.
    if (_formSignInKey.currentState!.validate()) {
      // Verifica si el formulario es válido.
      try {
        // Llama a la API de inicio de sesión.
        await _apiService.login(
          _emailController.text, // Usa el texto ingresado en el campo de correo.
          _passwordController.text, // Usa el texto ingresado en el campo de contraseña.
        );

        // Si es exitoso, navega a la siguiente pantalla.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => const NavBar(), // Navega a la pantalla NavBar.
          ),
        );

      } catch (error) {
        // Si hay error, muestra un mensaje de error.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error')), // Muestra el error en un SnackBar.
        );
      }
    } else {
      // Si el formulario no es válido, muestra un mensaje de error.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('oh no, algo salió mal')), // Mensaje por defecto de error.
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Método que construye la interfaz de la pantalla.
    return CustomScaffold(
      // Usa un widget personalizado para el diseño de la pantalla.
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10, // Espacio en la parte superior.
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0), // Padding del contenedor.
              decoration: const BoxDecoration(
                color: Colors.white, // Color de fondo del contenedor.
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0), // Esquinas redondeadas en la parte superior izquierda.
                  topRight: Radius.circular(40.0), // Esquinas redondeadas en la parte superior derecha.
                ),
              ),
              child: SingleChildScrollView(
                // Permite desplazamiento si el contenido es demasiado grande.
                child: Form(
                  key: _formSignInKey, // Asocia la clave del formulario.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Centra los elementos en el eje horizontal.
                    children: [
                      Text(
                        "ingresa tus datos", // Título de la pantalla.
                        style: TextStyle(
                          fontSize: 30.0, // Tamaño de fuente.
                          fontWeight: FontWeight.w900, // Grosor de la fuente.
                          color: lightColorScheme.primary, // Color de texto del tema.
                        ),
                      ),
                      const SizedBox(
                        height: 40.0, // Espacio entre el título y el siguiente elemento.
                      ),
                      // Campo de email
                      TextFormField(
                        controller: _emailController, // Controlador para el campo de email.
                        validator: (value) {
                          // Función de validación para el campo de email.
                          if (value == null || value.isEmpty) {
                            return "por favor ingresa tu nombre"; // Mensaje de error si está vacío.
                          }
                          return null; // Devuelve null si la validación es exitosa.
                        },
                        decoration: InputDecoration(
                          label: const Text("Correo"), // Etiqueta del campo.
                          hintText: "ingresa tu nombre", // Texto de sugerencia.
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(66, 10, 10, 10), // Color del texto de sugerencia.
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Color del borde.
                            ),
                            borderRadius: BorderRadius.circular(10), // Esquinas redondeadas del borde.
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Color del borde cuando el campo está habilitado.
                            ),
                            borderRadius: BorderRadius.circular(10), // Esquinas redondeadas del borde.
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(136, 127, 25, 25)), // Color del borde cuando el campo está enfocado.
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0, // Espacio entre el campo de email y el de contraseña.
                      ),
                      // Campo de contraseña
                      TextFormField(
                        controller: _passwordController, // Controlador para el campo de contraseña.
                        obscureText: true, // Oculta el texto ingresado.
                        obscuringCharacter: "*", // Caracter que se usa para ocultar el texto.
                        validator: (value) {
                          // Función de validación para el campo de contraseña.
                          if (value == null || value.isEmpty) {
                            return "por favor ingresa tu contraseña"; // Mensaje de error si está vacío.
                          }
                          return null; // Devuelve null si la validación es exitosa.
                        },
                        decoration: InputDecoration(
                          label: const Text("Contraseña"), // Etiqueta del campo.
                          hintText: "ingresa tu contraseña", // Texto de sugerencia.
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(66, 10, 10, 10), // Color del texto de sugerencia.
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Color del borde.
                            ),
                            borderRadius: BorderRadius.circular(10), // Esquinas redondeadas del borde.
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Color del borde cuando el campo está habilitado.
                            ),
                            borderRadius: BorderRadius.circular(10), // Esquinas redondeadas del borde.
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(136, 127, 25, 25)), // Color del borde cuando el campo está enfocado.
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber), // Color del borde en caso de error.
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0, // Espacio entre el campo de contraseña y el botón de inicio.
                      ),
                      SizedBox(
                        width: double.infinity, // Ancho máximo para el botón.
                        child: ElevatedButton(
                          onPressed: _signIn, // Llama a la función de inicio de sesión al presionar el botón.
                          child: const Text('Iniciar'), // Texto del botón.
                        ),
                      ),
                      const SizedBox(
                        height: 25.0, // Espacio después del botón.
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
