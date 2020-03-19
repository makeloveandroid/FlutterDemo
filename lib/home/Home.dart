import 'package:flutter/material.dart';
import 'package:flutterdemo/extend.dart';
import 'package:flutterdemo/home/Pager.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  static pushHome(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return Home();
        },
        settings: RouteSettings(name: "homoe")));
  }

  static popToHome(BuildContext context) {
    Navigator.of(context).popUntil((route) {
      var bool = route.settings?.name?.contains("homoe") ?? false;
      return bool;
    });
  }
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
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
      child: RaisedButton(
        child: Text("跳转页"),
        onPressed: () => Pager.push(context, 0),
      ),
    );
  }
}
