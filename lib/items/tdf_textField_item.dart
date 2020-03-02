import 'package:flutter/material.dart';
import 'package:lovetv_app/items/tdf_base_item.dart';

// ignore: must_be_immutable
class TDFTextFieldItem extends TDFBaseItem {
  TDFTextFieldItem(String title, String textValue,[String preValue,String detail]) : super(title, textValue,preValue,detail);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TDFTextFieldItemState();
  }


}

class TDFTextFieldItemState extends State<TDFTextFieldItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
//      width: double.infinity,
      child: new Column(
        children: <Widget>[
          Offstage(
            offstage: false,
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              width:  double.infinity,
              child: Material(
                child: Text('未保存',style: TextStyle(backgroundColor: Color(0xffFF0133),color: Colors.white,fontSize: 10),),
                borderRadius: BorderRadius.circular(2),
              ),
//              child: Text('未保存',style: TextStyle(backgroundColor: Color(0xffFF0133),color: Colors.white),),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left:10,right: 10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
//                      padding: const EdgeInsets.only(top: 10),
                      child: Text('原料名称'),
                    ),
                    Expanded(
                        child:Container(
                          padding: const EdgeInsets.only(top: 10),
                          height: 30,
                          child:  TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: '必填',
                              border: InputBorder.none,
                            ),
                            style: TextStyle(fontSize: 15,),
                            textAlign: TextAlign.right,
                            cursorColor: Color(0xff0088ff),
                          ),
                        ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 15,
                  child: Text('这里是描述文字，描述文字，描述作用',style: TextStyle(fontSize: 12,color:Color(0xff666666))),
                ),
              ],

            ),
          ),
          Container(
            width: double.infinity,
            child: Divider(height: 1,indent: 0,),
            padding: const EdgeInsets.only(top: 10),
          ),


        ],
      ),
    );
  }

}