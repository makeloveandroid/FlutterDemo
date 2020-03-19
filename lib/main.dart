import 'package:flutter/material.dart';
import 'package:flutterdemo/home/Home.dart';
import 'package:flutterdemo/pager/BottomSheetHeight.dart';
import 'package:flutterdemo/pager/BottomSheetKey2.dart';
import 'package:flutterdemo/pager/Clip.dart';
import 'package:flutterdemo/pager/Key.dart';
import 'package:flutterdemo/pager/Keyboard.dart';
import 'package:flutterdemo/pager/MyBottomSheetHeight.dart';
import 'package:flutterdemo/pager/Offstage.dart';
import 'package:flutterdemo/pager/UnconstrainedBox.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            _buildPagerButton("UnconstrainedBox", UnconstrainedBoxDemo()),
            _buildPagerButton("BottomSheetHeight高度限制问题", BottomSheetHeight()),
            _buildPagerButton("裁切", ClipDemo()),
            _buildPagerButton("key问题", KeyDome()),
            _buildPagerButton("Offstage展示隐藏", OffstageDemo()),
            _buildPagerButton("弹出键盘", BottomSheetKey()),
            _buildPagerButton("改造BottomSheet", MyBottomSheetDemo()),
            RaisedButton(
              child: Text("一次性到首页"),
              onPressed: () => Home.pushHome(context),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _buildPagerButton(String text, Widget page) {
    return RaisedButton(
      child: Text(text),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return page;
        }));
      },
    );
  }
}
