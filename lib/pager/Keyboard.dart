import 'package:flutter/material.dart';
import 'package:flutterdemo/extend.dart';

class KeyboardDemo extends StatefulWidget {
  @override
  _KeyboardDemoState createState() => _KeyboardDemoState();
}

class _KeyboardDemoState extends State<KeyboardDemo> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print("context:${context.hashCode}");
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      resizeToAvoidBottomInset: false,
      key: globalKey,
      body: SafeArea(child: Builder(
        builder: (context) {
          return _buildBody(context);
        },
      )),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.refresh),
//        onPressed: _refresh,
//      ),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            child: Text("弹出"),
            onPressed: () => show(context),
          ),
          RaisedButton(
            child: Text("退出"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  void _refresh() {
    setState(() {});
  }

  getWidget() {
    return TextField(
      decoration: InputDecoration(border: OutlineInputBorder()),
      autofocus: true,
    );
  }

  show(BuildContext scaffoldContext) {
    // 1. 错误1 No Scaffold widget found

    // 2. 解决 resizeToAvoidBottomInset: false 不随键盘上移动

    // 3. 解决 showModalBottomSheet 键盘布局不上移问题
    print("context2:${context.hashCode}");
//    globalKey.currentState.showBottomSheet(builder)

    showBottomSheet(
        context: scaffoldContext,
        builder: (context) {
          return ShowWidget();
        });
  }
}

class ShowWidget extends StatefulWidget {
  @override
  _ShowWidgetState createState() => _ShowWidgetState();
}

class _ShowWidgetState extends State<ShowWidget> {
  @override
  Widget build(BuildContext context) {
    return getWidget();
  }

  getWidget() {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      child: TextField(
        decoration: InputDecoration(border: OutlineInputBorder()),
        autofocus: true,
      ),
    );
  }
}
