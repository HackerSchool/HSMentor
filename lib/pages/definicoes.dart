import 'package:flutter/material.dart';
import 'package:hsmentor/pages/conta.dart';

class DefinicoesPagina extends StatelessWidget {
  const DefinicoesPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF6BBA75), // Change the color of the back arrow
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("definições",
            style: TextStyle(
                fontFamily: "Origami", color: Color(0xFF6BBA75), fontSize: 28)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 7,
        shadowColor: const Color(0xFF6BBA75),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContaPagina()));
            },
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding:
                    const EdgeInsets.only(left: 25.0, top: 16.0, bottom: 16.0),
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF6BBA75), // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
                  ),
                ),
                child: const Text("Conta",
                    style: TextStyle(color: Color(0xFF6BBA75), fontSize: 20)),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding:
                    const EdgeInsets.only(left: 25.0, top: 16.0, bottom: 16.0),
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF6BBA75), // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
                  ),
                ),
                child: const Text("Segurança e acesso à conta",
                    style: TextStyle(color: Color(0xFF6BBA75), fontSize: 20)),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding:
                    const EdgeInsets.only(left: 25.0, top: 16.0, bottom: 16.0),
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF6BBA75), // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
                  ),
                ),
                child: const Text("Sincronização com IST ID",
                    style: TextStyle(color: Color(0xFF6BBA75), fontSize: 20)),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding:
                    const EdgeInsets.only(left: 25.0, top: 16.0, bottom: 16.0),
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF6BBA75), // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
                  ),
                ),
                child: const Text("Notificações",
                    style: TextStyle(color: Color(0xFF6BBA75), fontSize: 20)),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding:
                    const EdgeInsets.only(left: 25.0, top: 16.0, bottom: 16.0),
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF6BBA75), // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
                  ),
                ),
                child: const Text("Display e Linguagem",
                    style: TextStyle(color: Color(0xFF6BBA75), fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
