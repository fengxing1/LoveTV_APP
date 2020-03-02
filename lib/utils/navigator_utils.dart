import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lovetv_app/home/view/home_detail.dart';
import 'package:lovetv_app/utils/anima_route.dart';
import 'package:lovetv_app/home/model/meiju.dart';
import 'package:lovetv_app/home/model/home_detail_model.dart';
import 'package:lovetv_app/home/view/home_tvplay.dart';

class NavigatorUtils {

  ///公共打开方式
  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context,
        new CupertinoPageRoute(builder: (context) => pageContainer(widget)));
  }

  ///Page页面的容器，做一次通用自定义
  static Widget pageContainer(widget) {
    return MediaQuery(
      ///不受系统字体缩放影响
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .copyWith(textScaleFactor: 1),
        child: widget);
  }

  //电影详情页
  static  goTVDetail(BuildContext context,Meiju meiju){
//    Navigator.push(context, new MaterialPageRoute(builder: (context)=>HomeDetail(tvCode)));
     Navigator.push(context, new SizeRoute(widget: pageContainer(HomeDetail(meiju))));
//    return NavigatorRouter(context, new HomeDetail(tvCode));
  }

  //视频播放页面

  static goTVPlay(BuildContext context,SeriesDetailModel seriesDetailModel) {
     Navigator.push(context, new MaterialPageRoute(builder: (context)=>HomeTVPlay(seriesDetailModel)));
  }

}