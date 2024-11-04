import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:siuu_app/screens/screens.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _intpage = 0;
  void _navigateBottonBar(int index) {
    setState(() {
      _intpage = index;
    });
  }

  final List<Widget> _pages = [
    const ListView1Screen(),
    const PruebaScreen(),
    const SignInScreen(),
  ];
  final GlobalKey<CurvedNavigationBarState> _curvednavigationkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_intpage],
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
        key: _curvednavigationkey,
        index: 0,
        height: 65.0,
        items: const [
          Icon(
            Icons.assignment,
            color: Colors.white,
          ),
          Icon(
            Icons.camera,
            color: Colors.white,
          ),
          // Icon(
          //   Icons.favorite,
          //   color: Colors.white,
          // )
        ],

        backgroundColor: const Color.fromARGB(0, 136, 49, 49),

        buttonBackgroundColor: const Color.fromARGB(212, 247, 95, 95),
        color: const Color.fromARGB(255, 84, 49, 47),
        animationDuration: const Duration(milliseconds: 600),
        animationCurve: Curves.easeInOut,
        onTap: _navigateBottonBar,

        // letIndexChange: (index) => true,
      ),
    );
  }
}
