import 'package:flutter/material.dart';
import 'package:hsmentor/models/local_refeicao.dart';

class RefeicaoForm extends StatefulWidget {
  final LocalRefeicao local;

  const RefeicaoForm({
    super.key,
    required this.local,
  });

  @override
  State<RefeicaoForm> createState() => _RefeicaoFormState();
}

class _RefeicaoFormState extends State<RefeicaoForm> {
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
                    "FEEDBACK SOBRE ${widget.local.nome}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6BBA75),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  )),
                  const SizedBox(height: 20),
                  Center(
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color(0xFF6BBA75),
                            width: 2.0,
                          ),
                        ),
                        labelText:
                            'Quanto tempo esperaste na fila (em minutos)? *',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color(0xFF6BBA75),
                            width: 2.0,
                          ),
                        ),
                        labelText: 'Avaliação global (de 1 a 5) *',
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6BBA75),
                        ),
                        child: const Text(
                          'Submeter',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
