import 'package:flutter/material.dart';
import 'package:flutterdemo/extend.dart';

class OffstageDemo extends StatefulWidget {
  @override
  _OffstageDemoState createState() => _OffstageDemoState();
}

class _OffstageDemoState extends State<OffstageDemo> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey();

  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      resizeToAvoidBottomInset: true,
      key: globalKey,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: _change,
      ),
      body: SafeArea(child: Builder(
        builder: (context) {
          return _buildBody(context);
        },
      )),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: _or(),
    );
  }

  _or() {
    // 想想有圆角效果吗?
    return GestureDetector(
      onTap: (){
        toast("点击到了");
      },
      child: Offstage(
        offstage: !isShow,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }

  void _change() {
    setState(() {
      isShow = !isShow;
    });
  }
}
