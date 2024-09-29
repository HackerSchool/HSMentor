import 'package:flutter/material.dart';
import 'package:hsmentor/components/faq_tile.dart';

class FAQ extends StatelessWidget {

  List<String> titles = ["Pergunta 1", "Pergunta 2", "Pergunta 3", "Pergunta 4"];
  List<String> fileName = ["file1.html", "file2.html", "file3.html", "file4.html"];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return FaqTile(
                  title:titles[index], 
                  fileName: fileName[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
