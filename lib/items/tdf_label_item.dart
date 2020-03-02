import 'package:flutter/material.dart';
import 'package:lovetv_app/items/tdf_base_item.dart';

class TDFLabelItem extends TDFBaseItem {
  TDFLabelItem(String title, String textValue,[String detail]) : super(title, textValue,detail);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TDFLabelItemState();
  }


}

class TDFLabelItemState extends State<TDFLabelItem> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.only(left: 10,top: 15,right: 10),
      width: double.infinity,
//      padding: EdgeInsets.only(left:10,top: 15,bottom: 15 ),
      child:Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(widget.title,style: TextStyle(fontSize: 15,color: Color(0xff333333)),),
              Expanded(
                  child: Text(
                    widget.textValue,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 15,color: Color(0xff333333)),
                  )),

            ],
          ),
          Offstage(
            offstage: (widget.detail == null || widget.detail.isEmpty ),
            child:Container(
              padding: const EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Text(widget.detail!=null?widget.detail:'',style: TextStyle(fontSize: 12,color:Color(0xff666666)),),
            ) ,
          ),

          Container(
            width: double.infinity,
            child: Divider(height: 1,indent: 0,),
            padding: const EdgeInsets.only(top: 10),
          ),


//          Row(
//            children: <Widget>[
//              Text('建议输入汉字，数字，英文')
//            ],
//          ),
//          Container(
//            child:Text('建议输入汉字，数字，英文',textAlign: TextAlign.right,),
//          ),
        ],

      ),
    );
  }

}