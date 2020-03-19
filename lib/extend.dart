import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String msg, {ToastGravity gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIos: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}


extension WidgetExt on Widget {
  Widget size({double width, double height}) {
    return Container(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget padding(EdgeInsetsGeometry padding) {
    return Padding(
      child: this,
      padding: padding,
    );
  }

  Widget marginOrPadding(
      {EdgeInsetsGeometry margin = const EdgeInsets.all(0),
      EdgeInsetsGeometry padding = const EdgeInsets.all(0)}) {
    return Container(
      margin: margin,
      child: this,
      padding: padding,
    );
  }

  Widget align(AlignmentGeometry alignment) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget onTap(VoidCallback onTap, {behavior = HitTestBehavior.opaque}) {
    return GestureDetector(
      behavior: behavior,
      onTap: onTap,
      child: this,
    );
  }

  Widget onTapInWell(
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: this,
    );
  }

  Widget visible(bool isVisible) {
    return Offstage(
      offstage: !isVisible,
      child: this,
    );
  }

  Widget showBoxConstraints({String qian}) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      print("$qian约束:$constraints");
      return this;
    });
  }

  Widget changeMaxSize({bool width = false, bool height = false}) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        print("约束:$constraints  ${constraints.maxHeight}  ${double.infinity}");
        double minWidth = constraints.minWidth,
            maxWidth = constraints.maxWidth,
            minHeight = constraints.minHeight,
            maxHeight = constraints.maxHeight;

        if (width) {
          minWidth = maxWidth;
        }

        if (height) {
          minHeight = maxHeight;
        }
        var c = BoxConstraints(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
            maxHeight: maxHeight);

        return Container(
          constraints: c,
          child: this,
        );
      },
    );
  }
}
