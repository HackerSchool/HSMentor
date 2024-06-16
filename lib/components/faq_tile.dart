import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FaqTile extends StatefulWidget {
  const FaqTile({super.key});

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: const Border(
          bottom: BorderSide(
                      color: Color(0xFF6BBA75), // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
          top: BorderSide(
                      color: Color(0xFF6BBA75), // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
          left: BorderSide(
                      color: Color(0xFF6BBA75), // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
          right: BorderSide(
                      color: Color(0xFF6BBA75), // Color of the bottom border
                      width: 1.0, // Width of the bottom border
                    ),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
            title: const Text(
                "Pergunta",
                style: TextStyle(
                  color: Color(0xFF6BBA75), 
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            leading: Icon( 
              _isExpanded ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up_outlined,
              size: 30,
              color: Color(0xFF6BBA75),
             ),
            onExpansionChanged: (bool expanded) {
              setState(() => _isExpanded = expanded);
            },
            controlAffinity: ListTileControlAffinity.leading,
            children: [
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color(0xFF6BBA75),
              ),
            ), 
              ListTile(
                title: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Commodo elit at imperdiet dui accumsan. Adipiscing tristique risus nec feugiat in fermentum posuere urna. Accumsan lacus vel facilisis volutpat. Malesuada pellentesque elit eget gravida cum sociis. Aenean euismod elementum nisi quis. Aliquet risus feugiat in ante metus dictum at tempor. Commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae. Accumsan in nisl nisi scelerisque eu ultrices vitae. A iaculis at erat pellentesque adipiscing commodo elit at. Sit amet volutpat consequat mauris nunc congue nisi vitae. Sit amet est placerat in egestas. Phasellus vestibulum lorem sed risus ultricies tristique nulla. Tincidunt tortor aliquam nulla facilisi cras fermentum. Amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan. At ultrices mi tempus imperdiet nulla. Mattis pellentesque id nibh tortor id aliquet lectus proin nibh. Enim sed faucibus turpis in eu mi bibendum neque."),
              )
            ],
          ),
      ),
    );
  }
}