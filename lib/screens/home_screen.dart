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

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // !este scaffold es la base para empezar tu app o lienzo para empezar a poner mis widgets

      
//       appBar: AppBar(
//         title: const Text('homeScreen'),
//       ),
//       // !esto me lo coloca en el centro
//       body: const Center(
//         child: Column(
//           // !esto me lo mueve vertical
//           mainAxisAlignment: MainAxisAlignment.center,

//           children: <Widget>[
//             Text('numero de taps!'),
//             Text('35'),
//             FadeInImage(
//                 placeholder: AssetImage('assets/fondo.jpg'),
//                 image: NetworkImage(
//                     'https://www.allkpop.com/upload/2024/01/content/040558/1704365932-20240104-felix.jpg'))
//           ],
//         ),
//       ),
//     );
//   }
// }