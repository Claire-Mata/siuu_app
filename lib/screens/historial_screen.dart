// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:siiu/services/api_services.dart';
import 'package:hive/hive.dart'; // Para acceder al token guardado

class HistorialScreen extends StatefulWidget {
  final Map<String, dynamic> hardwareDetails;

  const HistorialScreen({super.key, required this.hardwareDetails});

  @override
  _HistorialScreenState createState() => _HistorialScreenState();
}

class _HistorialScreenState extends State<HistorialScreen> {
  late Future<List<dynamic>> _history = Future.value([]);

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    var box = await Hive.openBox('authBox'); // Abrimos la caja donde tenemos el token
    String token = box.get('token') ?? ''; // Obtenemos el token

    if (token.isNotEmpty) {
      // Hacemos la solicitud del historial del equipo usando el categoryId y inventoryCode
      setState(() {
        _history = ApiService().getEquipmentHistoryByCategoryAndInventory(
          widget.hardwareDetails['category']['id'], // Accedemos al id de la categoría
          widget.hardwareDetails['inventory_code'], // Accedemos al código de inventario
          token,
        );
      });
    } else {
      // Si no hay token, mostramos un mensaje de error
      print('No token found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial del Activo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Detalles del hardware (ya lo tienes implementado)
            Text('Nombre: ${widget.hardwareDetails['name'] ?? 'No disponible'}', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('ID de Inventario: ${widget.hardwareDetails['inventory_code'] ?? 'No disponible'}'),
            SizedBox(height: 8),
            Text('Categoría: ${widget.hardwareDetails['category']['name'] ?? 'No disponible'}'),
            SizedBox(height: 8),
            Text('Estado: ${widget.hardwareDetails['status'] ?? 'No disponible'}'),
            SizedBox(height: 8),
            Text('Número de Serie: ${widget.hardwareDetails['serial_number'] ?? 'No disponible'}'),
            SizedBox(height: 8),
            Text('Fabricante: ${widget.hardwareDetails['manufacturer_id'] ?? 'No disponible'}'),
            SizedBox(height: 8),
            Text('Modelo: ${widget.hardwareDetails['model_id'] ?? 'No disponible'}'),
            SizedBox(height: 8),
            Text('Fecha de Expiración de Garantía: ${widget.hardwareDetails['warranty_expiration_date'] ?? 'No disponible'}'),

            // Otros detalles del hardware...
            SizedBox(height: 16),
            // Mostramos el historial
            FutureBuilder<List<dynamic>>(
              future: _history, // Usamos el Future
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay historial disponible'));
                }
                final histories = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true, // Usamos shrinkWrap para que la lista no ocupe todo el espacio
                  itemCount: histories.length,
                  itemBuilder: (context, index) {
                    final history = histories[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Acción: ${history['action'] ?? 'No disponible'}'),
                            Text('Descripcion: ${history['description'] ?? 'No disponible'}'),
                            Text('Fecha: ${history['created_at'] ?? 'No disponible'}'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}