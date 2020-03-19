import 'package:flutter/material.dart';
import 'package:flutterdemo/extend.dart';

class UnconstrainedBoxDemo extends StatefulWidget {
  @override
  _UnconstrainedBoxDemoState createState() => _UnconstrainedBoxDemoState();
}

class _UnconstrainedBoxDemoState extends State<UnconstrainedBoxDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: _refresh,
      ),
    );
  }

  _buildBody() {
    // 1. 大家猜想下这个布局长什么样?
    // 2. 如果让你改你会如何改?
    // 3. 为何会这样?

    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        print("constraints:$constraints");
        return Container(
          constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              maxWidth: constraints.maxWidth,
              minHeight: constraints.minHeight,
              maxHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("输入账号你的离开家地方据了解达到了快速减肥逻辑"),
              Text("-----输入密码"),
            ],
          ),
        );
      },
    );
  }

  void _refresh() {
    setState(() {});
  }
}
