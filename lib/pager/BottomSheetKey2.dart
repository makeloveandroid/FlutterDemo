import 'package:flutter/material.dart';
import 'package:flutterdemo/extend.dart';
import 'package:flutterdemo/widget/my_bottom_sheet.dart';

class BottomSheetKey extends StatefulWidget {
  @override
  _BottomSheetKeyState createState() => _BottomSheetKeyState();
}

class _BottomSheetKeyState extends State<BottomSheetKey> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("showBottomSheet 弹出"),
            onPressed: () => callShowBottomSheet(context),
          ),
          RaisedButton(
            child: Text("callShowModalBottomSheet 弹出"),
            onPressed: () => callShowModalBottomSheet(context),
          ),
          RaisedButton(
            child: Text("退出"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  callShowBottomSheet(BuildContext scaffoldContext) {
    showBottomSheet(
        context: scaffoldContext,
        builder: (context) {
          return TextFieldBody();
        });
  }

  callShowModalBottomSheet(BuildContext scaffoldContext) {
    myShowModalBottomSheet(
        context: scaffoldContext,
        builder: (context) {
          return TextFieldBody();
        });
  }
}

class TextFieldBody extends StatefulWidget {
  @override
  _TextFieldBodyState createState() => _TextFieldBodyState();
}

class _TextFieldBodyState extends State<TextFieldBody> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewInsets.bottom;
    print("键盘高度$height");
    return SafeArea(
        child: Container(
      padding: MediaQuery.of(context).viewInsets,
      color: Colors.white,
      child: TextField(
        autofocus: true,
      ),
    ));
  }
}
