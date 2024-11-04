import 'package:flutter/material.dart'; // Importa el paquete para la interfaz de usuario en Flutter.
import 'package:hive/hive.dart'; // Importa Hive, una base de datos local.
import 'package:siuu_app/services/api_services.dart'; // Importa el servicio para realizar llamadas a la API.
class ListView1Screen extends StatefulWidget {
  // Widget que representa una pantalla con una lista de activos.
  const ListView1Screen({super.key}); // Constructor con clave opcional para el widget.
  @override
  State<ListView1Screen> createState() => _ListView1ScreenState();
  // Crea el estado mutable para este widget.
}
class _ListView1ScreenState extends State<ListView1Screen> {
  // Clase de estado que controla ListView1Screen.
  String? token; // Variable para almacenar el token de autenticación.
  List<dynamic>? hardwareList; // Variable para almacenar la lista de activos.
  @override
  void initState() {
    // Método que se ejecuta al iniciar el estado.
    super.initState();
    _loadToken(); // Llama a la función que carga el token.
  }
  Future<void> _loadToken() async {
    // Función que carga el token de una caja en Hive.
    var box = await Hive.openBox('authBox'); // Abre la caja de autenticación.
    token = box.get('token'); // Recupera el token de la caja.
    if (token != null) {
      // Si el token existe
      await _fetchHardware(); // Obtiene la lista de hardware.
    }
    setState(() {}); // Actualiza el estado para reflejar cambios.
  }
  Future<void> _fetchHardware() async {
    // Función que obtiene la lista de hardware de la API.
    ApiService apiService = ApiService(); // Instancia el servicio de API.
    try {
      hardwareList = await apiService.getHardware(token!); // Llama a la API para obtener los activos.
    } catch (e) {
      print('Error al obtener hardware: $e'); // Imprime un error si la llamada falla.
    }
    setState(() {}); // Actualiza el estado para reflejar los datos obtenidos.
  }
  @override
  Widget build(BuildContext context) {
    // Método que construye la interfaz de la pantalla.
    return Scaffold(
      // Estructura de la pantalla con AppBar y contenido en el cuerpo.
      appBar: AppBar(title: const Text('Lista de Activos')), // Título en la barra de la aplicación.
      body: hardwareList != null
          ? ListView.builder(
              // Si hardwareList no es nulo, muestra la lista.
              itemCount: hardwareList!.length, // Número de elementos en la lista.
              itemBuilder: (context, index) {
                // Función que construye cada elemento en la lista.
                var hardware = hardwareList![index]; // Accede al elemento actual.
                var hardwareName = hardware['name'] ?? 'Nombre no disponible'; // Nombre del activo o valor por defecto.
                var inventoryCode = hardware['inventory_code'] ?? 'Código no disponible'; // Código de inventario o valor por defecto.
                var serialNumber = hardware['serial_number'] ?? 'Número de serie no disponible'; // Número de serie o valor por defecto.

                return ListTile(
                  // Widget que representa cada elemento de la lista.
                  title: Text(hardwareName), // Muestra el nombre del activo.
                  subtitle: Text('Código: $inventoryCode\nNúmero de serie: $serialNumber'), // Muestra código e info del activo.
                );
              },
            )
          : const Center(child: CircularProgressIndicator()), // Muestra un indicador de carga mientras se obtienen los datos.
    );
  }
}
