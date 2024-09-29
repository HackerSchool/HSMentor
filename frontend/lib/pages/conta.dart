import 'package:flutter/material.dart';

class ContaPagina extends StatelessWidget {
  const ContaPagina({super.key});

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
        title: const Text("conta",
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
            onTap: () {},
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, top: 16.0, bottom: 16.0),
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF6BBA75), // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
                  ),
                ),
                child: const Text("Informações da Conta", style: TextStyle(color: Color(0xFF6BBA75), fontSize: 20)),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, top: 16.0, bottom: 16.0),
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF6BBA75), // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
                  ),
                ),
                child: const Text("Mudar palavra-passe", style: TextStyle(color: Color(0xFF6BBA75), fontSize: 20)),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, top: 16.0, bottom: 16.0),
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF6BBA75), // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
                  ),
                ),
                child: const Text("Eliminar conta", style: TextStyle(color: Colors.red, fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}