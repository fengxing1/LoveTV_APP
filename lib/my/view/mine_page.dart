import 'package:flutter/material.dart';

/*
* 我的页面
* */

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MinePageState();
  }

}

class _MinePageState extends State<MinePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Text('我的'),
    );
  }

}