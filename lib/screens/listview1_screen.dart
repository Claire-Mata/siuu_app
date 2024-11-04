import 'package:flutter/material.dart';
import 'package:hive/hive.dart'; // Importa Hive
import 'package:siuu_app/services/api_services.dart';


class ListView1Screen extends StatefulWidget {
  const ListView1Screen({super.key});

  @override
  State<ListView1Screen> createState() => _ListView1ScreenState();
}

class _ListView1ScreenState extends State<ListView1Screen> {
  String? token; // Variable para almacenar el token
  List<dynamic>? hardwareList; // Variable para almacenar la lista de hardware

  @override
  void initState() {
    super.initState();
    _loadToken(); // Carga el token cuando se inicializa el estado
  }

  Future<void> _loadToken() async {
    var box = await Hive.openBox('authBox'); // Abre la caja
    token = box.get('token'); // Recupera el token
    if (token != null) {
      await _fetchHardware(); // Llama a la función para obtener el hardware si el token no es nulo
    }
    setState(() {}); // Actualiza el estado
  }

  Future<void> _fetchHardware() async {
    ApiService apiService = ApiService(); // Crea una instancia de ApiService
    try {
      hardwareList = await apiService.getHardware(token!); // Obtiene la lista de hardware
    } catch (e) {
      print('Error al obtener hardware: $e'); // Maneja cualquier error
    }
    setState(() {}); // Actualiza el estado para reflejar los cambios
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Activos')),
      body: hardwareList != null
          ? ListView.builder(
              itemCount: hardwareList!.length,
              itemBuilder: (context, index) {
                // Accede a los valores de manera segura
                var hardware = hardwareList![index];
                var hardwareName = hardware['name'] ?? 'Nombre no disponible'; // Usa un valor por defecto si es nulo
                var inventoryCode = hardware['inventory_code'] ?? 'Código no disponible'; // Usa un valor por defecto si es nulo
                var serialNumber = hardware['serial_number'] ?? 'Número de serie no disponible'; // Usa un valor por defecto si es nulo

                return ListTile(
                  title: Text(hardwareName),
                  subtitle: Text('Código: $inventoryCode\nNúmero de serie: $serialNumber'), // Muestra más información
                );
              },
            )
          : const Center(child: CircularProgressIndicator()), // Muestra un indicador de carga mientras se obtienen los datos
    );
  }
}
