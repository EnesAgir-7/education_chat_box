import 'package:StudyWiz/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:StudyWiz/overview/overview.dart' as overview;
import 'package:StudyWiz/overview/overview_main.dart' as overview_main;

class OverviewPage extends StatefulWidget {
  final int topicIndex;
  final String topicName;
  const OverviewPage({super.key, required this.topicIndex, required this.topicName});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight:   ,
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
                          Text(
                            overview.mathTopic[widget.topicIndex + 1] ?? '',
                            style: TextStyle(fontSize: 24),
                          ),
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

  void _showChat(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(overviewTopic: overview_main.mathTopic[widget.topicIndex]?? '', topicName: widget.topicName,)
      ),
    );
  }
}