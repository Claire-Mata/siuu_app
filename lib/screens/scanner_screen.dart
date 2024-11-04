import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart'; // Importa el paquete para escanear códigos de barras.

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key}); // Constructor de la clase ScannerScreen.

  @override
  ScannerScreenState createState() => ScannerScreenState(); // Crea el estado para esta pantalla.
}

class ScannerScreenState extends State<ScannerScreen> {
  String scanResult = 'Presione el botón para escanear'; // Mensaje inicial para el resultado del escaneo.

  // Método para iniciar el escaneo de código de barras.
  Future<void> startBarcodeScan() async {
    try {
      // Inicia el escaneo utilizando el paquete de escaneo de códigos de barras.
      String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Color del botón de cancelar en el escáner.
        'Cancelar', // Texto del botón de cancelar que se mostrará en el escáner.
        true, // Muestra el ícono del flash en el escáner.
        ScanMode.BARCODE, // Modo de escaneo, en este caso, escaneo de códigos de barras.
      );

      // Si el usuario no cancela el escaneo, actualiza el resultado escaneado.
      if (barcodeScanResult != '-1') {
        setState(() {
          scanResult = barcodeScanResult; // Actualiza el resultado del escaneo.
        });
      }
    } catch (e) {
      // Maneja cualquier error que ocurra durante el escaneo.
      setState(() {
        scanResult = 'Error al escanear: $e'; // Muestra el error en el resultado.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFF5F5DC), // Color de fondo opcional (comentado).
      appBar: AppBar(
        title: const Text('Escáner de Código de Barras'), // Título de la barra de aplicaciones.
      ),
      body: Center( // Centra el contenido en el cuerpo de la pantalla.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra los hijos en la columna.
          children: [
            Text(
              scanResult, // Muestra el resultado del escaneo.
              textAlign: TextAlign.center, // Centra el texto.
              style: const TextStyle(fontSize: 16), // Estilo del texto del resultado.
            ),
            const SizedBox(height: 20), // Espacio vertical entre el texto y el botón.
            ElevatedButton(
              onPressed: startBarcodeScan, // Llama al método de escaneo al presionar el botón.
              child: const Text('Escanear código de barras'), // Texto del botón.
            ),
          ],
        ),
      ),
    );
  }
}
