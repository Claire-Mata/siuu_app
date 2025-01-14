import 'package:flutter/material.dart';

class HistorialScreen extends StatelessWidget {
  final Map<String, dynamic> hardwareDetails;

  const HistorialScreen({super.key, required this.hardwareDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles del Activo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${hardwareDetails['name'] ?? 'No disponible'}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Código de Inventario: ${hardwareDetails['inventory_code'] ?? 'No disponible'}'),
            SizedBox(height: 8),
            Text('Número de Serie: ${hardwareDetails['serial_number'] ?? 'No disponible'}'),
            SizedBox(height: 8),
            Text('Descripción: ${hardwareDetails['description'] ?? 'No disponible'}'), // Campo adicional
            SizedBox(height: 8),
            Text('Estado: ${hardwareDetails['status'] ?? 'No disponible'}'), // Campo adicional
            SizedBox(height: 8),
            Text('Fecha de Adquisición: ${hardwareDetails['acquisition_date'] ?? 'No disponible'}'), // Campo adicional
          ],
        ),
      ),
    );
  }
}
