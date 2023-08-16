import 'package:exam_helper/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:exam_helper/overview/german_overview.dart' as overview;
import 'package:exam_helper/overview/german_overview.dart' as overview_main;
import 'package:html_parser_plus/html_parser_plus.dart';
import 'package:html/parser.dart' as html;

class GermanOverviewPage extends StatefulWidget {
  final int topicIndex;
  final String topicName;
  const GermanOverviewPage({super.key, required this.topicIndex, required this.topicName});

  @override
  State<GermanOverviewPage> createState() => _GermanOverviewPageState();
}

class _GermanOverviewPageState extends State<GermanOverviewPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Size get preferredSize => Size.fromHeight(100);

  String htmlString = '';
  String htmlStringDisplay = '';

  @override
  void initState() {
    htmlString = overview.germanTopic[widget.topicIndex]?? '';
    var documant = html.parse(htmlString);
    htmlStringDisplay = documant.outerHtml;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.topicName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 32,
                ),
              ),
              TextSpan(text: ' '),
              TextSpan(
                text: 'overview',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      return const LinearGradient(
                        colors: [Colors.transparent],
                        stops: [0.0],
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.screen,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: ListView(
                        controller: _scrollController,
                        children: [
                          Text(overview.germanTopic[widget.topicIndex]?? '',
                          style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 25,
            bottom: 25,
            child: FloatingActionButton(
              onPressed: _showChat, // Floating Action Button'a basıldığında _showChat fonksiyonu çağrılacak
              child: Icon(Icons.chat),
            ),
          ),
        ],
      ),
    );
  }

  void _showChat() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChatScreen(
                overviewTopic: overview.germanTopic[widget.topicIndex] ?? '',
                topicName: widget.topicName,
              )),
    );
  }
}
