import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class PruebaScreen extends StatefulWidget {
  const PruebaScreen({super.key});

  @override
  PruebaScreenState createState() => PruebaScreenState();
}

class PruebaScreenState extends State<PruebaScreen> {
  String scanResult = 'Presione el botón para escanear';

  Future<void> startBarcodeScan() async {
    try {
      // Inicia el escaneo
      String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Color del botón de cancelar
        'Cancelar', // Texto del botón de cancelar
        true, // Muestra el ícono del flash
        ScanMode.BARCODE, // Modo de escaneo
      );

      // Si el usuario no cancela, actualiza el resultado
      if (barcodeScanResult != '-1') {
        setState(() {
          scanResult = barcodeScanResult;
        });
      }
    } catch (e) {
      setState(() {
        scanResult = 'Error al escanear: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFF5F5DC), // Color beige
      appBar: AppBar(
        title: const Text('Escáner de Código de Barras'),
      ),
      body: Center( // Usar Center aquí
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              scanResult, // Texto sin espacios en blanco innecesarios
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
