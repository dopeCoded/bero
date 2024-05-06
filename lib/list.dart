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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),  // 横方向のパディングを少し減らす
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,  // 左揃えに設定
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
                  'Course Content',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 1,  // コンテナの幅を広げる
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.07,horizontal: MediaQuery.of(context).size.width * 0.05),
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
                            Text('Chapter 1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                            Text('Chapter 1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                              child: Text('Lesson 1:', style: TextStyle(fontSize: 18, color: Colors.white)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                              child: Text('Basic Topics', style: TextStyle(fontSize: 18, color: Colors.grey)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Next Lesson',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B1C1D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Chapter 1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                        child: Text('Lesson 2:', style: TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                        child: Text('Advanced Topics', style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ),
                      SizedBox(height: 20),
                      Center(  // Center ウィジェットを追加してボタンを中央に配置
                        child: ElevatedButton(
                          onPressed: () {
                            // Button action
                          },
                          child: Text('Start', style: TextStyle(fontSize: 18, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.blue,
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
    );
  }
}