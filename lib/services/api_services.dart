import 'dart:convert'; // Importa el paquete para codificación y decodificación JSON.
import 'package:http/http.dart' as http; // Importa el paquete http para realizar solicitudes HTTP.
import 'package:hive/hive.dart'; // Importa Hive para almacenamiento local.

class ApiService { // Define la clase ApiService para manejar la interacción con la API.
  static const String baseUrl = 'https://www.siiu.caprix.tech'; // URL base de la API.

  // Método para iniciar sesión
  Future<void> login(String email, String password) async { // Método asíncrono que recibe el correo y la contraseña.
    var url = Uri.parse('$baseUrl/api/login'); // Crea un URI para el endpoint de inicio de sesión.
    var response = await http.post(url, // Realiza una solicitud POST al endpoint.
      headers: { // Establece las cabeceras de la solicitud.
        'Accept': 'application/json', // Indica que se acepta JSON como respuesta.
        'Content-Type': 'application/json', // Indica que el cuerpo de la solicitud es JSON.
      },
      body: jsonEncode({ // Codifica el cuerpo de la solicitud como JSON.
        'email': email, // Agrega el correo electrónico al cuerpo.
        'password': password, // Agrega la contraseña al cuerpo.
      })
    );

    if (response.statusCode == 200) { // Verifica si el código de estado de la respuesta es 200 (OK).
      var jsonResponse = jsonDecode(response.body); // Decodifica la respuesta JSON.
      print('Login exitoso: $jsonResponse'); // Imprime la respuesta en caso de éxito.

      // Guarda el token en Hive
      var box = await Hive.openBox('authBox'); // Abre la caja de Hive llamada 'authBox' para almacenar datos.
      await box.put('token', jsonResponse['access_token']); // Guarda el token de acceso en la caja.
    } else { // Si la respuesta no es exitosa.
      print('Error al iniciar sesión: ${response.body}'); // Imprime el cuerpo de la respuesta de error.
      throw Exception('Credenciales erroneas'); // Lanza una excepción con un mensaje de error.
    }
  }

  // Método para obtener hardware
  Future<List<dynamic>> getHardware(String token) async { // Método asíncrono que recibe un token y retorna una lista.
    var url = Uri.parse('$baseUrl/api/hardware'); // Crea un URI para el endpoint que obtiene hardware.
    var response = await http.get( // Realiza una solicitud GET al endpoint.
      url,
      headers: { // Establece las cabeceras de la solicitud.
        'Authorization': 'Bearer $token', // Agrega el token de autorización en la cabecera.
        'Accept': 'application/json', // Indica que se acepta JSON como respuesta.
      },
    );

    if (response.statusCode == 200) { // Verifica si el código de estado de la respuesta es 200 (OK).
      var jsonResponse = jsonDecode(response.body); // Decodifica la respuesta JSON.
      print('Datos de hardware: $jsonResponse'); // Imprime la respuesta para depurar.
      return jsonResponse['data']; // Retorna la lista de datos de hardware extraída de la respuesta.
    } else { // Si la respuesta no es exitosa.
      throw Exception('Error al cargar hardware: ${response.body}'); // Lanza una excepción con un mensaje de error.
    }
  }
}
