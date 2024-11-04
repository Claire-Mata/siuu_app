import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart'; // Importa Hive

class ApiService {
  static const String baseUrl = 'https://www.siiu.caprix.tech'; // URL base

  // Método para iniciar sesión
  Future<void> login(String email, String password) async {
    var url = Uri.parse('$baseUrl/api/login'); // Endpoint para login
    var response = await http.post(url, 
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      })
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print('Login exitoso: $jsonResponse');

      // Guarda el token en Hive
      var box = await Hive.openBox('authBox'); // Abre la caja
      await box.put('token', jsonResponse['access_token']); // Asegúrate de que este sea el nombre correcto
    } else {
      print('Error al iniciar sesión: ${response.body}');
      throw Exception('Credenciales erroneas');
    }
  }

  // Método para obtener hardware
  Future<List<dynamic>> getHardware(String token) async {
    var url = Uri.parse('$baseUrl/api/hardware'); // Endpoint para obtener hardware
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token', // Añade el token en la cabecera de autorización
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print('Datos de hardware: $jsonResponse'); // Para depurar la respuesta
      return jsonResponse['data']; // Ajusta según la estructura de la respuesta de tu API
    } else {
      throw Exception('Error al cargar hardware: ${response.body}');
    }
  }
}
