import 'package:flutter/material.dart';

import 'package:siuu_app/widgets/widgets.dart';

class ListView1Screen extends StatefulWidget {
  const ListView1Screen({super.key});

  @override
  State<ListView1Screen> createState() => _ListView1ScreenState();
}

class _ListView1ScreenState extends State<ListView1Screen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: Column(
        children: [
          //Expanded(child: NavBar()),
        ],
      ),
    );
  }
}
