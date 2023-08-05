import 'package:exam_helper/screens/subject/math_topicList.dart';
import 'package:flutter/material.dart';

class MathTopics extends StatefulWidget {
  const MathTopics({super.key});

  @override
  State<MathTopics> createState() => _MathTopicsState();
}

class _MathTopicsState extends State<MathTopics> {
  List<String> _mathTopicList = [
    'Number and Quantity',
    'Algebra',
    'Functions',
    'Modeling',
    'Geometry',
    'Statistics and Probability',
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topic List"),
      ),
      body: ListView.builder(
        itemCount: _mathTopicList.length,
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
                    builder: (context) => TopicDetailPage(
                      topicIndex: index,
                      topicName: _mathTopicList[index],
                    ),
                  ),
                );
              },
              title: Text(
                _mathTopicList[index],
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

