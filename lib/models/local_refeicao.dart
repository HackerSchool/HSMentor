import 'package:flutter/material.dart';

class LocalRefeicao {
  final String nome;
  final int preco;
  final int avaliacao;
  final int tempoEspera;
  final String horario;
  final String ementa;
  final List<bool> opcoes;
  final String pathImagem;

  LocalRefeicao({
    required this.nome,
    required this.preco,
    required this.avaliacao,
    required this.tempoEspera,
    required this.horario,
    required this.opcoes,
    this.pathImagem = "",
    this.ementa = "",
  });
}
