import 'package:flutter/material.dart';

class Noticia {
  final String titulo;
  final String autor;
  final String texto;
  final String pathImagem;

  Noticia({
    required this.titulo,
    required this.autor,
    required this.texto,
    this.pathImagem = "",
  });
}
