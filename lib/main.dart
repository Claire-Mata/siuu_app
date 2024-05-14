import 'package:flutter/material.dart';

import 'package:siuu_app/screens/screens.dart';
import 'package:siuu_app/theme/app_theme.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SIUU',
        // home: Listview1Screen(),
        initialRoute: 'welcome',
        //home: NavBar(),
        routes: {
          'homeScreen': (context) => const HomeScreen(),
          'listView': (context) => const ListView1Screen(),
          'welcome': (context) => const WelcomeScreen(),
        },
        theme: lightMode);
  }
}
