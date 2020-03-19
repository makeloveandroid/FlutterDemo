import 'dart:math';

import 'package:flutter/material.dart';

class KeyDome extends StatefulWidget {
  @override
  _KeyDomeState createState() => _KeyDomeState();
}

class _KeyDomeState extends State<KeyDome> {
  List<Widget> widgets = [
    StatefulContainer(key: ValueKey("1"),),
    StatefulContainer(key: ValueKey("2")),
//    StatelessContainer(),
//    StatelessContainer(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchWidget,
        child: Icon(Icons.undo),
      ),
    );
  }

  switchWidget() {
    widgets.insert(0, widgets.removeAt(1));
    setState(() {});
  }
}

class StatelessContainer extends StatelessWidget {
  final Color color = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

getRandomColor() {
  return Color.fromARGB(255, Random.secure().nextInt(255),
      Random.secure().nextInt(255), Random.secure().nextInt(255));
}

///=====

class StatefulContainer extends StatefulWidget {
  StatefulContainer({Key key}) : super(key: key);

  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
  final Color color = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
