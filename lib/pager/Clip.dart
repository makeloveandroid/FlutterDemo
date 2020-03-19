import 'package:flutter/material.dart';
import 'package:flutterdemo/extend.dart';

class ClipDemo extends StatefulWidget {
  @override
  _ClipDemoState createState() => _ClipDemoState();
}

class _ClipDemoState extends State<ClipDemo> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      resizeToAvoidBottomInset: true,
      key: globalKey,
      body: SafeArea(child: Builder(
        builder: (context) {
          return _buildBody(context);
        },
      )),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: _clip2(),
    );
  }

  _clip2() {
    return ClipRRect(
        child: _or(),
        borderRadius: BorderRadius.circular(20));
  }

  _or() {
    // 想想有圆角效果吗?
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
    );
  }
}
