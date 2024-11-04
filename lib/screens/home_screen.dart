import 'package:flutter/material.dart';
import 'package:siuu_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: Column(
        children: [
          Text("hola"),
          Expanded(child: NavBar()),
          
        ],
        
      ),
      
      
    );
    
  }
}
