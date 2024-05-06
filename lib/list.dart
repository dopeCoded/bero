import 'package:flutter/material.dart';
import 'dart:math' as math;

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.00),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        size: 32,  // アイコンのサイズをテキストに合わせる
                      ),
                      Spacer(),
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.white,
                        size: 32,  // アイコンのサイズをテキストに合わせる
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
                    'Progress',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.99,
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.07,
                      top: MediaQuery.of(context).size.width * 0.035,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.035
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B1C1D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Chapter 1',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Text(''),
                              Text(
                                'Lesson 1: ',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              Text(
                                'Basic Topics',
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20), // スペースを追加
                  const Text(
                    'Next Lesson',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.99,
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B1C1D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Lesson 2',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const Text(
                          'Advanced Topics',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // ボタンが押された時のアクションをここに記述
                            },
                            child: Text(
                              'Start',
                              style: TextStyle(fontSize: 18, color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.blue, // ボタンのテキスト色
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}