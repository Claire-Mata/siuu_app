import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required this.screen});
  final Widget? screen;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/siuu.png',
      nextScreen: screen!,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 200,
      backgroundColor: const Color.fromARGB(255, 170, 27, 27),
    );
  }
}
