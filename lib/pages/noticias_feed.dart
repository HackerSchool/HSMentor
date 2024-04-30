// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hsmentor/components/noticias_tile.dart';
import 'package:hsmentor/models/noticia.dart';
import 'package:hsmentor/pages/faq.dart';
import 'package:hsmentor/pages/navegacao.dart';
import 'package:hsmentor/pages/noticia_detalhe.dart';
import 'package:hsmentor/pages/home.dart';
import 'package:hsmentor/pages/refeicoes.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class NoticiasFeed extends StatelessWidget {
  const NoticiasFeed({super.key});

  Future<void> handleRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    var routes = [FAQ(), Refeicoes(), Home(), Navegacao(), NoticiasFeed()];

    return Scaffold(
      appBar: AppBar(
        title: Text("feed de notícias",
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
      body: LiquidPullToRefresh(
        color: Color(0xFF6BBA75),
        backgroundColor: Colors.white,
        animSpeedFactor: 1.8,
        onRefresh: handleRefresh,
        child: Column(
          children: [
            // search bar
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xFF6BBA75), width: 1),
                      borderRadius: BorderRadius.circular(100)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Procurar notícias',
                          style: TextStyle(color: Colors.grey[600])),
                      Row(children: [
                        Padding(
                            padding: EdgeInsets.only(right: 5),
                            child:
                                Icon(Icons.search, color: Color(0xFF6BBA75))),
                        Icon(Icons.filter_alt, color: Color(0xFF6BBA75)),
                      ])
                    ],
                  ),
                )),

            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      Noticia noticia = Noticia(
                          titulo: "Lorem Ipsum",
                          autor: "HackerSchool",
                          texto:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Commodo elit at imperdiet dui accumsan. Adipiscing tristique risus nec feugiat in fermentum posuere urna. Accumsan lacus vel facilisis volutpat. Malesuada pellentesque elit eget gravida cum sociis. Aenean euismod elementum nisi quis. Aliquet risus feugiat in ante metus dictum at tempor. Commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae. Accumsan in nisl nisi scelerisque eu ultrices vitae. A iaculis at erat pellentesque adipiscing commodo elit at. Sit amet volutpat consequat mauris nunc congue nisi vitae. Sit amet est placerat in egestas. Phasellus vestibulum lorem sed risus ultricies tristique nulla. Tincidunt tortor aliquam nulla facilisi cras fermentum. Amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan. At ultrices mi tempus imperdiet nulla. Mattis pellentesque id nibh tortor id aliquet lectus proin nibh. Enim sed faucibus turpis in eu mi bibendum neque.",
                          pathImagem: "assets/Beer-Celebration-pana.png");
                      return NoticiasTile(
                        noticia: noticia,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NoticiaPage(noticia: noticia))),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF6BBA75),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: GNav(
            gap: 6,
            selectedIndex: 4,
            onTabChange: (index) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => routes[index]));
            },
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
