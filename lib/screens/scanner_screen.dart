import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:siiu/services/api_services.dart';
import 'package:siiu/screens/screens.dart';
import 'package:hive/hive.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  ScannerScreenState createState() => ScannerScreenState();
}

class ScannerScreenState extends State<ScannerScreen> {
  String scanResult = 'Presione el botón para escanear'; // Mensaje inicial
  List<dynamic> allEquipments = []; // Lista para almacenar los equipos desde la API

  // Método para iniciar el escaneo de código de barras.
  Future<void> startBarcodeScan() async {
    try {
      String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancelar', true, ScanMode.BARCODE,
      );

      if (barcodeScanResult != '-1') {
        // Actualiza el resultado del escaneo
        setState(() {
          scanResult = barcodeScanResult;
        });

        // Verifica el equipo en la lista
        _findEquipmentByBarcode(barcodeScanResult);
      } else {
        setState(() {
          scanResult = 'Escaneo cancelado';
        });
      }
    } catch (e) {
      setState(() {
        scanResult = 'Error al escanear: $e';
      });
    }
  }

  // Método para obtener todos los equipos desde la API
  Future<void> fetchAllEquipments() async {
    ApiService apiService = ApiService();
    var box = await Hive.openBox('authBox');
    String? token = box.get('token');

    if (token == null) {
      setState(() {
        scanResult = 'Token no encontrado. Por favor inicie sesión de nuevo.';
      });
      return;
    }

    try {
      var response = await apiService.getAllEquipments(token); // Llama a la API
      if (response != null && response['data'] != null) {
        setState(() {
          allEquipments = response['data']; // Almacena los equipos en la lista
        });
      } else {
        setState(() {
          scanResult = 'No se encontraron equipos.';
        });
      }
    } catch (e) {
      setState(() {
        scanResult = 'Error al obtener equipos: $e';
      });
    }
  }

  // Método para buscar un equipo por código de barras
  void _findEquipmentByBarcode(String barcode) {
    var matchedEquipment = allEquipments.firstWhere(
      (equipment) => equipment['inventory_code'] == barcode,
      orElse: () => null,
    );

    if (matchedEquipment != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HistorialScreen(hardwareDetails: matchedEquipment),
        ),
      );
    } else {
      setState(() {
        scanResult = 'No se encontró un equipo con este código de barras.';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllEquipments(); // Carga los equipos al iniciar la pantalla
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escáner de Código de Barras'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              scanResult,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: startBarcodeScan,
              child: const Text('Escanear código de barras'),
            ),
          ],
        ),
      ),
    );
  }
}
