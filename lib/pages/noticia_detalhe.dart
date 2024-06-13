import 'package:flutter/material.dart';
import 'package:hsmentor/models/noticia.dart';

class NoticiaDetail extends StatefulWidget {
  final Noticia noticia;

  const NoticiaDetail({
    super.key,
    required this.noticia,
  });

  @override
  State<NoticiaDetail> createState() => _NoticiaDetailState();
}

class _NoticiaDetailState extends State<NoticiaDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícia",
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
            Image.asset(widget.noticia.pathImagem),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.noticia.titulo,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.noticia.autor,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10),
                  Text(widget.noticia.texto, style: TextStyle(fontSize: 16))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
