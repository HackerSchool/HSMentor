import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqTile extends StatefulWidget {
  final String title;
  final String fileName;

  const FaqTile({super.key, required this.title, required this.fileName});

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  bool _isExpanded = false;
  String _htmlContent = '';

  @override
  void initState() {
    super.initState();
    _loadHtmlFile();
  }

  Future<void> _loadHtmlFile() async {
    final String content = await rootBundle.loadString("assets/faqHTML/" + widget.fileName);
    setState(() {
      _htmlContent = content;
    });
  } 

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
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
            title: Text(
                widget.title,
                style: const TextStyle(
                  color: Color(0xFF6BBA75), 
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            leading: Icon( 
              _isExpanded ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined,
              size: 30,
              color: const Color(0xFF6BBA75),
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
                color: const Color(0xFF6BBA75),
              ),
            ), 
              ListTile(
                title: _htmlContent.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Html(
                    data: _htmlContent,
                    onLinkTap: (String? url, __, _) {
                      if (url != null && url.isNotEmpty) {
                        _launchURL(url);
                      }
                    },
                  ),
              ),
            ],
          ),
      ),
    );
  }
}