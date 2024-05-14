import 'package:flutter/material.dart';
import 'package:siuu_app/screens/screens.dart';
import 'package:siuu_app/theme/app_theme.dart';
import 'package:siuu_app/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                      text: "!Bienvenido!\n",
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w600,
                      )),
                  TextSpan(
                      text: '\nhacia la libertad por la cultura',
                      style: TextStyle(
                        fontSize: 20,
                      ))
                ]),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: "sobre nosotros",
                      onTap: ListView1Screen(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: "ingresar",
                      onTap: const SplashScreen(screen: SignInScreen()),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
