import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hsmentor/pages/faq.dart';
import 'package:hsmentor/pages/home.dart';
import 'package:hsmentor/pages/navegacao.dart';
import 'package:hsmentor/pages/noticias_feed.dart';
import 'package:hsmentor/pages/refeicoes.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {

  int _selectedIndex = 2;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> routes = [FAQ(), Refeicoes(), Home(), Navegacao(), NoticiasFeed()];
  final List<String> titles = ["faq", "refeições", "hsmentor", "navegação", "notícias"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex],
            style: TextStyle(
                fontFamily: "Origami", color: Colors.white, fontSize: 28)),
        centerTitle: true,
        backgroundColor: Color(0xFF6BBA75),
        elevation: 0,
        leading: Padding(
            padding: EdgeInsets.only(left: 5),
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings, size: 35, color: Colors.white))),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 5),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.white,
                  )))
        ],
      ),

      body: routes[_selectedIndex],

      bottomNavigationBar: Container(
          color: Color(0xFF6BBA75),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: GNav(
              gap: 6,
              selectedIndex: 2,
              onTabChange: (index) => navigateBottomBar(index),
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
        ),
    );
  }
}