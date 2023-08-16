import 'package:exam_helper/screens/subject/german_overview.dart';
import 'package:exam_helper/screens/subject/overview.dart';
import 'package:flutter/material.dart';

class GermanTopicPage extends StatefulWidget {
  final int topicIndex;
  final String topicName;
  const GermanTopicPage({super.key, required this.topicIndex, required this.topicName});

  @override
  State<GermanTopicPage> createState() => _GermanTopicPageState();
}

class _GermanTopicPageState extends State<GermanTopicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topicName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
               // Overview tile
              _subtopicContentTile('Overview', 'overview', const EdgeInsets.fromLTRB(8, 0, 4, 0), () => _openOverviewPage()),

              // Basics tile
              _disabledSubtopicContentTile('Basic', 'basics', const EdgeInsets.fromLTRB(28, 10, 28, 8), () => null),
            ],
          )),
          Expanded(
            child: Row(
              children: [
                // Exercises tile
              _disabledSubtopicContentTile('Exercises', 'exercises', const EdgeInsets.fromLTRB(12, 0, 12, 0), () => null),

              // Exams tile
              _disabledSubtopicContentTile('Exams', 'exams', const EdgeInsets.fromLTRB(22, 0, 22, 8), () => null)
              ],
            )
          )
        ],
      ),
    );
  }

  Expanded _subtopicContentTile(String label, String contentType, EdgeInsetsGeometry iconPadding, Function onTilePressed) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
        child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // gradient:
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            ),
            child: ElevatedButton(
                onPressed: () => onTilePressed(),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    elevation: MaterialStateProperty.all<double>(0.0),
                    backgroundColor: MaterialStateProperty.all(Colors.blue[100]),
                    minimumSize: MaterialStateProperty.all(Size(0.0, 0.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ))),
                child: Column(children: [
                  Container(padding: const EdgeInsets.fromLTRB(8, 16, 8, 0), child: subtopicTileTitleText(label, screenWidth)),
                  Expanded(child: Container(padding: iconPadding, child: _tileIcon(contentType))),
                ]))));
  }


  Expanded _disabledSubtopicContentTile(String label, String contentType, EdgeInsetsGeometry iconPadding, Function onTilePressed) {
      double screenWidth = MediaQuery.of(context).size.width;
      return Expanded(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                // gradient:
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
                child: ElevatedButton(
                  onPressed: () => onTilePressed(),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                      elevation: MaterialStateProperty.all<double>(0.0),
                      backgroundColor: MaterialStateProperty.all(Colors.blue[100]),
                      minimumSize: MaterialStateProperty.all(Size(0.0, 0.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ))),
                  child:  Column(
                    children: [
                      Container(padding: const EdgeInsets.fromLTRB(8, 16, 8, 0), child: subtopicTileTitleText(label, screenWidth)),
                      Expanded(
                        child: Container(
                          padding: iconPadding,
                          child: _tileIcon(contentType)
                        )
                      ),
                      
                    ]
                  )
                )
              )
            ),
            Positioned.fill(
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 0.6),//  Colors.grey.withOpacity(0.6),
                borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.block, color: Colors.red[400], size: 72),
                  ]
                )
              )
            )
          )
          ]
        )
      );
    }


  Image _tileIcon(String contentType) {
    String iconFileName = 'assets/subject/topics/$contentType.png';
    return Image.asset(
      iconFileName,
      errorBuilder: (context, exception, stackTrace) {
        return const Text('');
      },
    );
  }

  void _openOverviewPage() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GermanOverviewPage(
          topicIndex: widget.topicIndex,
          topicName: widget.topicName,
        ),
      ),
    );
  }

  static Text subtopicTileTitleText(String text, double screenWidth) {
    double fontSize = 23.0; // original: 24
    if (screenWidth < 371) {
      fontSize = 22.0;
    } else if (screenWidth < 361) {
      fontSize = 19.0;
    } else if (screenWidth < 351) {
      fontSize = 17.5;
    }
    return Text(text, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.red[400]));
  }
}
