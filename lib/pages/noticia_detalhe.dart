import 'package:flutter/material.dart';
import 'package:hsmentor/models/noticia.dart';

class NoticiaPage extends StatefulWidget {
  final Noticia noticia;

  const NoticiaPage({
    super.key,
    required this.noticia,
  });

  @override
  State<NoticiaPage> createState() => _NoticiaPageState();
}

class _NoticiaPageState extends State<NoticiaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hsmentor",
            style: TextStyle(
                fontFamily: "Origami", color: Colors.white, fontSize: 28)),
        centerTitle: true,
        backgroundColor: Color(0xFF6BBA75),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:
                Icon(Icons.arrow_back_ios_new, size: 30, color: Colors.white)),
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
