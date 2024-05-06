import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
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
                  'Progress',
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
                            Text(''),
                            Text('Lesson 1:', style: TextStyle(fontSize: 18, color: Colors.white),),
                            Text('Basic Topics', style: TextStyle(fontSize: 18, color: Colors.grey),),
                          ],
                        ),
                      ),
                      AnimatedCircleProgress(percentage: 75),
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
                      Text(''),
                      Text('Lesson 2:', style: TextStyle(fontSize: 18, color: Colors.white)),
                      Text('Advanced Topics', style: TextStyle(fontSize: 18, color: Colors.grey)),
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


class AnimatedCircleProgress extends StatefulWidget {
  final double percentage;

  const AnimatedCircleProgress({Key? key, required this.percentage}) : super(key: key);

  @override
  _AnimatedCircleProgressState createState() => _AnimatedCircleProgressState();
}

class _AnimatedCircleProgressState extends State<AnimatedCircleProgress> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // アニメーションの長さ
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: widget.percentage).animate(_controller)
      ..addListener(() {
        setState(() {}); // ウィジェットを再描画
      });

    _controller.forward(); // アニメーションを開始
  }

  @override
  void didUpdateWidget(AnimatedCircleProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.percentage != oldWidget.percentage) {
      _animation = Tween<double>(begin: 0, end: widget.percentage).animate(_controller)
        ..addListener(() {
          setState(() {}); // ウィジェットを再描画
        });
      _controller
        ..reset()
        ..forward(); // 新しい値でアニメーションを再開
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircleProgress(_animation.value), // アニメーション値を使用
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        height: MediaQuery.of(context).size.width * 0.28,
      ),
    );
  }
}

class CircleProgress extends CustomPainter {
  final double percentage;
  CircleProgress(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = Color(0xFFB9FC4F)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    Paint completeLine = Paint()
      ..color = Colors.green[800]!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = math.min(size.width / 2, size.height / 2);

    // Background circle
    canvas.drawCircle(center, radius, completeLine);

    // Progress circle
    double arcAngle = 2 * math.pi * (percentage / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -math.pi / 2,
        arcAngle, false, line);

    // Text drawing
    TextSpan span = TextSpan(
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        text: '${percentage.toInt()}%');
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, Offset(center.dx - tp.width / 2, center.dy - tp.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
