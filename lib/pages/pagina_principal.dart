import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hsmentor/components/barra_navegacao.dart';
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

      bottomNavigationBar: BarraNavegacao(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}