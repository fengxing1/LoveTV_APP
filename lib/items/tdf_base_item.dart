import 'package:flutter/material.dart';

class TDFBaseItem extends StatefulWidget {

  //左侧标题
  String title;
  //下方描述
  String detail;
  //右侧label显示的值
  String textValue;
  //原先设置的值
  String preValue;
  //可编辑状态下右侧字体颜色
  Color textColor;
  //自定义右侧placeholder字体颜色
  Color placeHolderColor;



  TDFBaseItem(this.title, this.textValue,[this.detail,this.preValue]);



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TDFBaseItemState();
  }

}

class TDFBaseItemState extends State<TDFBaseItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}