import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BarraNavegacao extends StatelessWidget {

  void Function(int)? onTabChange;

  BarraNavegacao({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Color(0xFF6BBA75),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: GNav(
              gap: 6,
              selectedIndex: 2,
              onTabChange: (index) => onTabChange!(index),
              backgroundColor: Color(0xFF6BBA75),
              color: Colors.white,
              activeColor: Color(0xFF6BBA75),
              tabBackgroundColor: Colors.white,
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.question_mark,
                  text: "FAQ",
                ),
                GButton(
                  icon: Icons.restaurant,
                  text: "Refeições",
                ),
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.navigation,
                  text: "Navegação",
                ),
                GButton(
                  icon: Icons.newspaper,
                  text: "Notícias",
                )
              ],
            ),
          ),
        );
  }
}