import 'package:flutter/material.dart';
import 'package:hsmentor/models/local_refeicao.dart';

const OPCOES_SIZE = 3;

class RefeicaoDetail extends StatefulWidget {
  final LocalRefeicao local;

  const RefeicaoDetail({
    super.key,
    required this.local,
  });

  @override
  State<RefeicaoDetail> createState() => _RefeicaoDetailState();
}

class _RefeicaoDetailState extends State<RefeicaoDetail> {
  opcoesToString() {
    List<String> res = [];
    List<String> opcoes = ["vegetariano", "vegan", "sem glúten"];

    for (int i = 0; i < OPCOES_SIZE; i++) {
      if (widget.local.opcoes[i]) {
        res.add(opcoes[i]);
      }
    }

    return res.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refeições",
            style: TextStyle(
                fontFamily: "Origami", color: Color(0xFF6BBA75), fontSize: 28)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 7,
        shadowColor: const Color(0xFF6BBA75),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new,
                size: 30, color: Color(0xFF6BBA75))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    widget.local.nome,
                    style: TextStyle(
                        color: Color(0xFF6BBA75),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )),
                  const SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                        height: 50,
                        width: 115,
                        child: TextButton(
                          onPressed: () => {},
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF6BBA75),
                            foregroundColor: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.navigation),
                              Text("Direções", style: TextStyle(fontSize: 16))
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 16.0, bottom: 16.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color:
                                Color(0xFF6BBA75), // Color of the bottom border
                            width: 1.0, // Width of the bottom border
                          ),
                          bottom: BorderSide(
                            color:
                                Color(0xFF6BBA75), // Color of the bottom border
                            width: 1.0, // Width of the bottom border
                          ),
                        ),
                      ),
                      child: Text("Inclui opções: " + opcoesToString(),
                              style: TextStyle(
                                  color: Color(0xFF6BBA75), fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("EMENTA:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(widget.local.ementa, style: TextStyle(fontSize: 16))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
