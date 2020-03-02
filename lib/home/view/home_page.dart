import 'package:flutter/material.dart';
import 'package:lovetv_app/home/view/homeContentPage.dart';

/*
* 首页 显示
*
* */

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePageState();
  }


}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  TabController topTabController;
  List<String> _tabList;
  List<Widget> _tabbarViews;

  @override
  void initState(){
    super.initState();
    initTabData();
    topTabController = TabController(
        length: _tabList.length,
        vsync: this,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    topTabController.dispose();
  }

  void initTabData(){
    _tabList = [
      '推荐',
      '美剧'
    ];
    _tabbarViews = [
      new HomeContentPage(),
      new Center(child: new Text('美剧')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
        bottom: new TabBar(
          tabs: <Widget>[
            new Tab(text: _tabList[0]),
            new Tab(text: _tabList[1]),
          ],
          controller: topTabController,
        ),
      ),

      body:new TabBarView(
          controller: topTabController,
          children: _tabbarViews,),
    );
  }

}
