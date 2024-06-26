import 'package:flutter/material.dart';
import 'package:hsmentor/models/noticia.dart';

class NoticiasTile extends StatelessWidget {
  Noticia noticia;
  final void Function()? onTap;

  NoticiasTile({super.key, required this.noticia, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 25, right: 25),
      width: 300,
      decoration: BoxDecoration(
          color: Color(0xFF6BBA75), borderRadius: BorderRadius.circular(30)),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: Image.asset(noticia.pathImagem, fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${noticia.titulo}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  Text(
                    "${noticia.autor}",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text.rich(
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(text: noticia.texto),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
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
