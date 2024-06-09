// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hsmentor/components/noticias_tile.dart';
import 'package:hsmentor/models/noticia.dart';
import 'package:hsmentor/pages/faq.dart';
import 'package:hsmentor/pages/navegacao.dart';
import 'package:hsmentor/pages/noticia_detalhe.dart';
import 'package:hsmentor/pages/noticias_feed.dart';
import 'package:hsmentor/pages/refeicoes.dart';

import '../models/aula.dart';
import '../models/avaliacao.dart';

import 'package:hsmentor/components/aulas_tile.dart';
import 'package:hsmentor/components/avaliacoes_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var routes = [FAQ(), Refeicoes(), Home(), Navegacao(), NoticiasFeed()];

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24))
                  ],
                )),

            const SizedBox(height: 10),

            // Next classes list
            SizedBox(
              height: 250,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    Aula aula = Aula(
                        disciplina: "CDI-III",
                        tipo: "T",
                        inicio: DateTime(2024, 2, 25, 10, 0),
                        fim: DateTime(2024, 2, 25, 11, 0),
                        sala: "P01");
                    return AulasTile(
                      aula: aula,
                    );
                  }),
            ),

            const SizedBox(height: 10),

            // Title "Próximas Avaliações"
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text("Próximas Avaliações 📝",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    Tooltip(
                      height: 10,
                      message:
                          "A HSMentor consulta as avaliações inseridas pelos docentes no Fénix. No entanto, caso algumas avaliações não estejam registadas no Fénix, não nos responsabilizamos por eventuais omissões na secção abaixo.",
                      child: Icon(Icons.info, color: Color(0xFF6BBA75)),
                    )
                  ],
                )),

            const SizedBox(height: 10),

            SizedBox(
              height: 150,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    Avaliacao avaliacao = Avaliacao(
                        disciplina: "MO",
                        nome: "Exame 1ª Época",
                        inicio: DateTime(2024, 2, 25, 10, 0),
                        fim: DateTime(2024, 2, 25, 11, 0),
                        sala: "P01");
                    return AvaliacoesTile(
                      avaliacao: avaliacao,
                    );
                  }),
            ),

            const SizedBox(height: 10),

            // Title "Últimas Notícias"
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text("Últimas Notícias 📰",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24))
                  ],
                )),

            const SizedBox(height: 10),

            SizedBox(
              height: 400,
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
          ]),
        ),
      );
  }
}
