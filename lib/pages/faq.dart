import 'package:flutter/material.dart';
import 'package:hsmentor/components/faq_tile.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return FaqTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}
