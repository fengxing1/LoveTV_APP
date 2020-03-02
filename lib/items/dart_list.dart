import 'package:flutter/material.dart';
import 'tdf_label_item.dart';
import 'tdf_textField_item.dart';

class DartList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DartListState();
  }

}

class DartListState extends State<DartList> {
  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('控件列表'),
      ),
      body: ListView(
        children: <Widget>[
          TDFLabelItem('采购原料', '土豆饼子','详情描述点点点'),
          TDFTextFieldItem('采购原料', '土豆饼子'),

        ],
      ),

    );
  }



}