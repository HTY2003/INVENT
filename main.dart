import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:swipedetector/swipedetector.dart';
import "dart:math";

String word = "World";

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.grey,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home:PV(),
  ));
}

class PV extends StatelessWidget {
  Widget build(BuildContext context) {
    return PageViewDemo();
  }
}

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        Page1(),
        Page2(),
        Page3(),
      ],
    );
  }
}

class Page3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return P3();
  }
}

class P3 extends StatefulWidget {
  _P3State createState() => _P3State();
}

class _P3State extends State<P3> {
  String word = "World";
  Widget build(BuildContext context) {
    return SwipeDetector(
        child: Scaffold(
          body: Center(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Hello ' + word + '!',
                      style: TextStyle(
                        fontSize: 50,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w200,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment(0, 0.8),
                    child: Text(
                      '< swipe to sell your soul',
                      style: TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ),
      onSwipeLeft: ()
      {
        setState(() {
          word = (nouns.toList()..shuffle()).first.inCaps;
        });
      },
      swipeConfiguration: SwipeConfiguration(
          horizontalSwipeMaxHeightThreshold: 100.0,
          horizontalSwipeMinDisplacement:30.0,
          horizontalSwipeMinVelocity: 30.0),

    );
  }
}

class Page1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 1'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}