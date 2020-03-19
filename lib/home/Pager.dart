import 'package:flutter/material.dart';
import 'package:flutterdemo/extend.dart';
import 'package:flutterdemo/home/Home.dart';

class Pager extends StatefulWidget {
  int index;

  Pager(this.index);

  @override
  _PagerState createState() => _PagerState();

  static push(BuildContext context, int index) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Pager(index + 1);
    }));
  }
}

class _PagerState extends State<Pager> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我是副页"),
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
    return Column(
      children: <Widget>[
        Text("第${widget.index}页"),
        RaisedButton(
          child: Text("进入下一页"),
          onPressed: () => Pager.push(context, widget.index),
        ),
        RaisedButton(
          child: Text("跳转到HOME"),
          onPressed: () => Home.popToHome(context),
        )
      ],
    );
  }
}
