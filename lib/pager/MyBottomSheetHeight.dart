import 'package:flutter/material.dart';
import 'package:flutterdemo/widget/my_bottom_sheet.dart';

class MyBottomSheetDemo extends StatefulWidget {
  @override
  _MyBottomSheetDemoState createState() => _MyBottomSheetDemoState();
}

class _MyBottomSheetDemoState extends State<MyBottomSheetDemo> {
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
            child: Text("去除showModalBottomSheet阴影"),
            onPressed: () => show(context),
          ),
          RaisedButton(
            child: Text("不允许showModalBottomSheet下滑关闭"),
            onPressed: () => show2(context),
          ),
          RaisedButton(
            child: Text("监听showModalBottomSheet下滑事件"),
            onPressed: () => show3(context),
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

  show3(BuildContext scaffoldContext) {
    myShowModalBottomSheet(
      dragCallBack: (value){
        print("滚动距离$value");
      },
        context: scaffoldContext,
        builder: (context) {
          return NotificationListener(child: getWidget(),onNotification: (value){
            // 通过这里监听滚动
            return true;
          },);
        });
  }

  show2(BuildContext scaffoldContext) {
    myShowModalBottomSheet(
        enableDrag: false,
        context: scaffoldContext,
        builder: (context) {
          return getWidget();
        });
  }

  show(BuildContext scaffoldContext) {
    myShowModalBottomSheet(
        isHaveBarrierColor: false,
        context: scaffoldContext,
        builder: (context) {
          return getWidget();
        });
  }
}
