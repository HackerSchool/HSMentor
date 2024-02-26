// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'models/aula.dart';
import 'models/avaliacao.dart';

import 'package:hsmentor/components/aulas_tile.dart';
import 'package:hsmentor/components/avaliacoes_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("hsmentor",
              style: TextStyle(
                  fontFamily: "Origami", color: Colors.white, fontSize: 28)),
          centerTitle: true,
          backgroundColor: Color(0xFF6BBA75),
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, size: 35, color: Colors.white)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.white,
                ))
          ],
        ),
        body: Column(children: [
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
                    Text('Estou à procura de...',
                        style: TextStyle(color: Colors.grey[600])),
                    Icon(Icons.search, color: Color(0xFF6BBA75)),
                  ],
                ),
              )),

          // Title "Próximas aulas"
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text("Próximas Aulas ⏰",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                ],
              )
          ),
        
          const SizedBox(height: 10),

          // Next classes list
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                Aula aula = Aula(disciplina: "CDI-III", tipo: "T", inicio: DateTime(2024, 2, 25, 10, 0), fim: DateTime(2024, 2, 25, 11, 0), sala: "P01");
                return AulasTile(
                  aula: aula,
                );
              }
            ),
          ),

          const SizedBox(height: 10),

          // Title "Próximas Avaliações"
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text("Próximas Avaliações 📝",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                ],
              )
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                Avaliacao avaliacao = Avaliacao(disciplina: "MO", nome: "Exame 1ª Época", inicio: DateTime(2024, 2, 25, 10, 0), fim: DateTime(2024, 2, 25, 11, 0), sala: "P01");
                return AvaliacoesTile(
                  avaliacao: avaliacao,
                );
              }
            ),
          ),
        
          const SizedBox(height: 10),

          // Title "Últimas Notícias"
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text("Últimas Notícias 📰",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                ],
              )
          ),

        ]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 2,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF6BBA75),
            unselectedItemColor: Colors.grey[40],
            selectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.question_mark),
                  label: "FAQ",
                  activeIcon: Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(Icons.question_mark,
                              color: Color(0xFF6BBA75))))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.restaurant),
                  label: "Refeições",
                  activeIcon: Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(Icons.restaurant,
                              color: Color(0xFF6BBA75))))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  activeIcon: Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(Icons.home, color: Color(0xFF6BBA75))))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.navigation),
                  label: "Navegação",
                  activeIcon: Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(Icons.navigation,
                              color: Color(0xFF6BBA75))))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                  label: "Notícias",
                  activeIcon: Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child:
                              Icon(Icons.newspaper, color: Color(0xFF6BBA75)))))
            ]),
      ),
    );
  }
}
