// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/avaliacao.dart';

class AvaliacoesTile extends StatelessWidget {
  Avaliacao avaliacao;
  AvaliacoesTile({super.key, required this.avaliacao});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 25, right: 25),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF6BBA75), width: 1),
        borderRadius: BorderRadius.circular(100)
      ),
      child: 
        Padding (padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${avaliacao.disciplina}, ${avaliacao.nome}",
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 20,
                  color: Color(0xFF6BBA75)),
              ),
              Text("${DateFormat.Hm().format(avaliacao.inicio)} - ${DateFormat.Hm().format(avaliacao.fim)} @ ${avaliacao.sala}"),
            ],
          ),
        ),
    );
  }
}