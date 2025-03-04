import 'package:flutter/material.dart'; // Importa el paquete para la interfaz de usuario en Flutter.
import 'package:hive/hive.dart'; // Importa Hive, una base de datos local que permite almacenar datos de forma sencilla.
import 'package:siiu/services/api_services.dart'; // Importa el servicio para realizar llamadas a la API.
import 'dart:async'; // Importa el paquete para usar StreamController y Streams.
import 'screens.dart'; // Importa la nueva pantalla de detalles del hardware.

class ListView1Screen extends StatefulWidget {
  const ListView1Screen({super.key}); // Constructor del widget, permite pasar una clave opcional.

  @override
  State<ListView1Screen> createState() => _ListView1ScreenState(); // Crea el estado mutable para este widget.
}

class _ListView1ScreenState extends State<ListView1Screen> {
  String? token; // Variable para almacenar el token de autenticación.
  List<dynamic>? hardwareList = []; // Variable para almacenar la lista de activos, inicializada como lista vacía.
  List<dynamic>? filteredHardwareList = []; // Variable para almacenar la lista filtrada de hardware, inicializada como lista vacía.
  late StreamController<List<dynamic>> _hardwareStreamController; // Declara un controlador de stream para gestionar la lista de hardware.
  Timer? _timer; // Variable para almacenar el temporizador que se usará para actualizar los datos.
  TextEditingController _searchController = TextEditingController(); // Controlador para el campo de búsqueda.

  @override
  void initState() {
    super.initState(); // Llama al método initState de la clase padre.
    _hardwareStreamController = StreamController<List<dynamic>>.broadcast(); // Inicializa el StreamController con soporte de múltiples oyentes.
    _loadToken(); // Llama a la función que carga el token de autenticación.

    // Configura un temporizador para actualizar la lista de hardware cada 5 segundos.
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (token != null) {
        _fetchHardware(); // Si el token es válido, se llama a la función para obtener la lista de hardware.
      }
    });

    // Agrega un listener al controlador de búsqueda para filtrar la lista según la entrada del usuario.
    _searchController.addListener(() {
      _filterHardwareList(_searchController.text); // Filtra la lista de hardware cada vez que el texto cambia.
    });
  }

  Future<void> _loadToken() async {
    var box = await Hive.openBox('authBox'); // Abre la caja de autenticación en Hive.
    token = box.get('token'); // Recupera el token de la caja.
    if (token != null) { // Verifica si el token existe.
      await _fetchHardware(); // Si existe, llama a la función para obtener la lista de hardware.
    }
    setState(() {}); // Actualiza el estado para reflejar cualquier cambio (como la carga del token).
  }

  Future<void> _fetchHardware() async {
    ApiService apiService = ApiService(); // Crea una instancia del servicio de API para hacer solicitudes.
    try {
      // Intenta obtener la lista de hardware desde la API.
      var fetchedHardwareList = await apiService.getHardware(token!); // Llama a la API para obtener los activos usando el token.
      hardwareList = fetchedHardwareList; // Asigna la lista obtenida a la variable hardwareList.

      // Envía la nueva lista al StreamController para que los oyentes sean notificados.
      _hardwareStreamController.sink.add(hardwareList!); // Agrega la lista al sink del StreamController.
      _filterHardwareList(''); // Filtra la lista para mostrar todos los activos inicialmente.
    } catch (e) {
      print('Error al obtener hardware: $e'); // Imprime un mensaje de error si la llamada a la API falla.
    }
  }

  void _filterHardwareList(String query) {
    // Filtra la lista de hardware según el texto ingresado en el campo de búsqueda.
    final filteredList = hardwareList!.where((hardware) {
      var hardwareName = hardware['name']?.toLowerCase() ?? ''; // Obtiene el nombre del hardware en minúsculas.
      var inventoryCode = hardware['inventory_code']?.toLowerCase() ?? ''; // Obtiene el código de inventario en minúsculas.
      var serialNumber = hardware['serial_number']?.toLowerCase() ?? ''; // Obtiene el número de serie en minúsculas.

      // Comprueba si alguno de los campos contiene el texto de búsqueda.
      return hardwareName.contains(query.toLowerCase()) ||
             inventoryCode.contains(query.toLowerCase()) ||
             serialNumber.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredHardwareList = filteredList; // Actualiza la lista filtrada.
    });
  }

  @override
  void dispose() {
    _hardwareStreamController.close(); // Cierra el StreamController al destruir el widget para liberar recursos.
    _timer?.cancel(); // Cancela el temporizador si está activo.
    _searchController.dispose(); // Libera el controlador de búsqueda.
    super.dispose(); // Llama al método dispose de la clase padre.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Activos')), // Crea la barra de la aplicación con un título.
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0), // Agrega un padding alrededor del campo de búsqueda.
            child: TextField(
              controller: _searchController, // Asigna el controlador de búsqueda.
              decoration: InputDecoration(
                labelText: 'Buscar activos', // Etiqueta del campo de búsqueda.
                border: OutlineInputBorder(), // Borde del campo de búsqueda.
                prefixIcon: Icon(Icons.search), // Ícono de búsqueda dentro del campo.
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<dynamic>>(
              stream: _hardwareStreamController.stream, // Escucha el stream del controlador de hardware.
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator()); // Muestra un indicador de carga mientras se obtienen los datos.
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}')); // Muestra un mensaje de error si ocurre un problema.
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay activos disponibles.')); // Mensaje si no hay activos en la lista.
                }

                // Utiliza los datos del snapshot para construir la lista.
                final hardwareListToShow = filteredHardwareList ?? snapshot.data!; // Obtiene la lista de hardware a mostrar (filtrada o completa).

                return ListView.builder(
                  itemCount: hardwareListToShow.length, // Establece el número de elementos en la lista.
                  itemBuilder: (context, index) {
                    var hardware = hardwareListToShow[index]; // Accede al elemento actual en la lista.
                    var hardwareName = hardware['name'] ?? 'Nombre no disponible'; // Obtiene el nombre del activo o un valor por defecto.
                    var inventoryCode = hardware['inventory_code'] ?? 'Código no disponible'; // Obtiene el código de inventario o un valor por defecto.
                    var serialNumber = hardware['serial_number'] ?? 'Número de serie no disponible'; // Obtiene el número de serie o un valor por defecto.

                    return ListTile(
                      title: Text(hardwareName), // Muestra el nombre del hardware en el título.
                      subtitle: Text('Código: $inventoryCode | Serie: $serialNumber'), // Muestra el código de inventario y el número de serie.
                      onTap: () {
                        // Cuando se toca un activo, navega a la pantalla de detalles del hardware.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistorialScreen(
                              hardwareDetails: {
                                'name': hardware['name'],
                                'inventory_code': hardware['inventory_code'],
                               'category': hardware['category'], // Pasamos el objeto completo de la categoría
                               'status':hardware['status'],
                               'serial_number':hardware['serial_number'],
                               'manufacturer_id':hardware['manufacturer_id'],
                               'model_id':hardware['model_id'],
                               'warranty_expiration_date':hardware['warranty_expiration_date'],
                                // Otros detalles del hardware...
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
