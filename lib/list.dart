import 'package:flutter/material.dart';
import 'lecture.dart';
import 'dart:math' as math;

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  final List<String> lessons = [
    "Basic Topics",
    "Intermediate Topics",
    "Advanced Topics",
    "Expert Topics",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Germany',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.expand_more,
                      color: Colors.white,
                      size: 32,
                    ),
                    Spacer(),
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.red,
                      size: 32,
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Course Content',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 10),
                ...lessons.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String lesson = entry.value;
                  return Column(
                    children: [
                      lessonWidget(context, idx, lesson),
                      SizedBox(height: 10),  // ここで間に余白を挟む
                    ],
                  );
                }).toList(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget lessonWidget(BuildContext context, int index, String lessonName) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.01, horizontal: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1C1D),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${index + 1}   ',  // インデックスを1から数えるように +1
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                TextSpan(
                  text: lessonName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.play_circle, color: Colors.blue, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LectureScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}