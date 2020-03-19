import 'package:flutter/material.dart';

class BottomSheetHeight extends StatefulWidget {
  @override
  _BottomSheetHeightState createState() => _BottomSheetHeightState();
}

class _BottomSheetHeightState extends State<BottomSheetHeight> {
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
      child: Column(
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

  getWidget() {
    double height = MediaQuery.of(context).size.height * 0.8;
    return Container(
      height: height,
      color: Colors.red,
    );
  }

  show(BuildContext scaffoldContext) {
    showModalBottomSheet(
        // 这里是关键
        isScrollControlled: true,
        context: scaffoldContext,
        builder: (context) {
          return getWidget();
        });
  }
}
