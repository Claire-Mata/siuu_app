import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Importa hive_flutter
import 'package:siuu_app/screens/screens.dart';
import 'package:siuu_app/theme/app_theme.dart';

void main() async {
  // Inicializa Hive
  WidgetsFlutterBinding.ensureInitialized(); // Asegúrate de que Flutter esté inicializado
  await Hive.initFlutter(); // Inicializa Hive

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIIU',
      initialRoute: 'welcome',
      routes: {
        'homeScreen': (context) => const HomeScreen(),
        'listView': (context) => const ListView1Screen(),
        'welcome': (context) => const WelcomeScreen(),
      },
      theme: lightMode,
    );
  }
}
