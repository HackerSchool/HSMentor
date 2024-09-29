import 'package:flutter/material.dart';
import 'package:hsmentor/models/local_refeicao.dart';
import 'package:hsmentor/pages/refeicao_form.dart';

class RefeicoesTile extends StatelessWidget {
  LocalRefeicao local;
  final void Function()? onTap;

  RefeicoesTile({super.key, required this.local, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20, left: 25, right: 25),
        width: 300,
        decoration: BoxDecoration(
            color: Color(0xFF6BBA75), borderRadius: BorderRadius.circular(30)),
        child: GestureDetector(
          onTap: onTap,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: Image.asset(local.pathImagem, fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${local.nome}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '€' * local.preco + ' - ' + '★' * local.avaliacao,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: SizedBox(
                                    height: 45,
                                    width: 45,
                                    child: TextButton(
                                      onPressed: () => {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Color(0xFF6BBA75),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.navigation,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ))),
                            SizedBox(
                                height: 45,
                                width: 45,
                                child: TextButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RefeicaoForm(local: local))),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Color(0xFF6BBA75),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.edit_note,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "Tempo de espera: ${local.tempoEspera} min",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Horario de funcionamento: ${local.horario}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
          ]),
        ));
  }
}
