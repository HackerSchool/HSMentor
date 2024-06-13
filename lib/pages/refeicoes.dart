import 'package:flutter/material.dart';
import 'package:hsmentor/components/refeicoes_tile.dart';
import 'package:hsmentor/models/local_refeicao.dart';
import 'package:hsmentor/pages/refeicao_detalhe.dart';

class Refeicoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    Text('Procurar locais',
                        style: TextStyle(color: Colors.grey[600])),
                    Row(children: [
                      Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.search, color: Color(0xFF6BBA75))),
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
                    LocalRefeicao local = LocalRefeicao(
                        nome: "CANTINA DE AÇÃO SOCIAL",
                        preco: 1,
                        avaliacao: 3,
                        tempoEspera: 5,
                        horario:
                            "\n\t\tSegundas a sextas das 11:30 às 20:30\n\t\tSábados das 11:30 às 15",
                        opcoes: [true, true, true],
                        ementa: "TBA",
                        pathImagem: "assets/cantina_social.jpg");
                    return RefeicoesTile(
                      local: local,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RefeicaoDetail(local: local))),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
