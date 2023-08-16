import 'package:exam_helper/screens/subject/german_topicList.dart';
import 'package:flutter/material.dart';

class GermanTopics extends StatefulWidget {
  const GermanTopics({super.key});

  @override
  State<GermanTopics> createState() => _GermanTopicsState();
}

class _GermanTopicsState extends State<GermanTopics> {
  List<String> _germanTopicList = [
    'Epochen',
    'Literarische Gattungen Epik, Lyrik und Drama',
    'Sprachliche Mittel',
    'Rechtschreibung',
    'Epochen',
    'Literatur',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topic List"),
      ),
      body: ListView.builder(
        itemCount: _germanTopicList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              onTap: () {
                // Navigate to the TopicDetailPage with both the index and name of the topic
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GermanTopicPage(
                      topicIndex: index,
                      topicName: _germanTopicList[index],
                    ),
                  ),
                );
              },
              title: Text(
                _germanTopicList[index],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
