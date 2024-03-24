import 'package:flutter/material.dart';

class Noticia {
  final String titulo; 
  final String autor;
  final String texto;
  final Image? imagem;

  Noticia({
    required this.titulo, 
    required this.autor, 
    required this.texto, 
    this.imagem, });
}