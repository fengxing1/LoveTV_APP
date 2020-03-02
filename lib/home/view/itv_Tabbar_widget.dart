import 'package:flutter/material.dart';
import 'package:lovetv_app/find/view/findPage.dart';
import 'package:lovetv_app/home/view/home_page.dart';
import 'package:lovetv_app/my/view/mine_page.dart';
import 'package:lovetv_app/items/dart_list.dart';

class ItvTabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: new MainPageWidget(),
    );
  }

}

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MainPageState();
  }

}
class _MainPageState extends State<MainPageWidget>{
  int _tabIndex = 0;
  var appBarTitles = ['首页','发现','我的'];
  //图片列表
  var tabbarImages;

  var _pageList;

  Image getTabIcon(int curIndex) {
    if(curIndex == _tabIndex) {
      return tabbarImages[curIndex][1];
    }
    return tabbarImages[curIndex][0];

  }

  Text getTabTitle(int curIndex) {
    if(curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
        style: new TextStyle(fontSize: 14.0),

      );
    } else {
      return new Text(appBarTitles[curIndex],
        style: new TextStyle(fontSize: 14.0),);
    }
  }

  Image getTabImage(path) {
    return new Image.asset(path,width: 36.0,height: 36.0,);
  }

  void initData(){
    tabbarImages =[
      [getTabImage('static/images/shouye.png'),getTabImage('static/images/shouye_select.png')],
      [getTabImage('static/images/chaxun.png'),getTabImage('static/images/chaxun_select.png')],
      [getTabImage('static/images/wode.png'),getTabImage('static/images/wode_select.png')],
    ];

    _pageList = [
      new HomePage(),
      new DartList(),
      new MinePage(),
    ];
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    initData();
    return Scaffold(
      body: _pageList[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(icon: getTabIcon(0),title: getTabTitle(0)),
            new BottomNavigationBarItem(icon: getTabIcon(1),title: getTabTitle(1)),
            new BottomNavigationBarItem(icon: getTabIcon(2),title: getTabTitle(2)),
          ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _tabIndex,
      iconSize: 24.0,
      onTap: (index){
            setState(() {
              _tabIndex = index;
            });
      },

      ),
    );
  }

}





