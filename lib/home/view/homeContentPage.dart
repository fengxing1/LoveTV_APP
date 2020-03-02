import 'package:flutter/material.dart';
import 'package:lovetv_app/home/model/meiju.dart';
import 'package:lovetv_app/home/model/homePage.dart';
import 'package:lovetv_app/home/model/lunbo.dart';
import 'package:lovetv_app/dao/home_dao.dart';
import 'package:lovetv_app/dao/dao_result.dart';
import 'package:lovetv_app/utils/navigator_utils.dart';
import 'package:lovetv_app/utils/swiper.dart';

class HomeContentPage extends StatefulWidget {
  BuildContext context;
  HomePage _homePageModel;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeContentState();
  }

}




class _HomeContentState extends State<HomeContentPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    List listData1 = new List<Meiju>();
//    for(int i=0;i<20;i++){
//      Meiju meiju = new Meiju('032', '黑袍纠察队', 'Killer Instinct/Dr. Death', '艾伦·卡明,博亚娜·诺瓦科维奇,丹尼尔·英格斯,迈克尔·B·希尔', '道格拉斯·阿尔尼奥科斯基', '', '0', '第06集', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2561538317.jpg');
//      listData1.add(meiju);
//    }
//
//    List listData2 = new List<Meiju>();
//    for(int i=0;i<20;i++){
//      Meiju meiju = new Meiju('032', '黑袍纠察队', 'Killer Instinct/Dr. Death', '艾伦·卡明,博亚娜·诺瓦科维奇,丹尼尔·英格斯,迈克尔·B·希尔', '道格拉斯·阿尔尼奥科斯基', '', '0', '第06集', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2561538317.jpg');
//      listData2.add(meiju);
//    }
//
//    List listData3 = new List<Meiju>();
//    for(int i=0;i<20;i++){
//      Meiju meiju = new Meiju('032', '黑袍纠察队', 'Killer Instinct/Dr. Death', '艾伦·卡明,博亚娜·诺瓦科维奇,丹尼尔·英格斯,迈克尔·B·希尔', '道格拉斯·阿尔尼奥科斯基', '', '0', '第06集', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2561538317.jpg');
//      listData3.add(meiju);
//    }

//    _homePageModel = new HomePage(List<Lunbo>(), listData1, listData2, listData3);

    // TODO: implement build
    requestPage() async {
      DataResult resultData = await HomeDao.getTVList();
      HomePage homeModel = HomePage.fromJson(resultData.data);

      setState(() {
        widget._homePageModel = homeModel;

      });

    }

    requestPage();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
//      child: BuildGrid(listData),
      child:  HomePageWidget(widget._homePageModel,context),
    );
  }


  void _handleTap(BuildContext context,Meiju meiju) {
    NavigatorUtils.goTVDetail(context,meiju);


  }

  List<Container> _buildGridTileList(List<Meiju> tvList,BuildContext context) {
    return new List<Container>.generate(
        tvList.length,
            (int index) =>
        new Container(
          child: new GestureDetector(
            onTap: (){
              _handleTap(context,tvList[index]);
            },
            child: new Column(
              children: <Widget>[
                Expanded(child:
                Image.network(
                  tvList[index].img,
                  fit: BoxFit.cover,

                ),
                ),
                new Container(
                  height: 30,
                  padding: const EdgeInsets.only(top: 5),
                  child: new Text(
                    tvList[index].title,
                    textAlign: TextAlign.justify,
                    style: new TextStyle(fontSize: 13.0),
                    maxLines: 1,
                  ),
                ),

              ],
            ),
          ),

        )
    );
  }


  Widget BuildGrid(List<Meiju> tvList,BuildContext context){
    return new GridView.extent(
      shrinkWrap: true,
      physics:NeverScrollableScrollPhysics(),
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(5.0),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      childAspectRatio: 0.6,
      children:_buildGridTileList(tvList,context),
    );
  }


  Widget HomePageWidget(HomePage homePageModel,BuildContext context) {
    if(homePageModel == null) {
      return Container();
    }
    return new SingleChildScrollView(
      child: new Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      AspectRatio(
      aspectRatio: 16.0 / 9.0,
        child: Swiper(
          indicatorAlignment: AlignmentDirectional.bottomEnd,
          speed: 400,
          indicator: CircleSwiperIndicator(),
          children: <Widget>[
            Image.network(homePageModel.lunboList[0].img,fit: BoxFit.cover,),
            Image.network(homePageModel.lunboList[1].img,fit: BoxFit.cover,),
            Image.network(homePageModel.lunboList[2].img,fit: BoxFit.cover,),
          ],
        ),
      ),
          tvCard(homePageModel.meijuList, '最新美剧',context),
          tvCard(homePageModel.hanjuList, '最新韩剧',context),
          tvCard(homePageModel.rijuList, '最新日剧',context),
        ],

      ),
    );
  }

  Widget tvCard(List<Meiju> tvList,String title,BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.only(left: 10),
          height: 50,
          child: new Row(
            children: <Widget>[
              new Image.asset('static/images/tv_icon.png',width: 24,height: 24,fit: BoxFit.cover,),
              new Container(
                padding: const EdgeInsets.only(left: 10),
                child:new Text(title) ,
              )
            ],

          ),
        ),
        BuildGrid(tvList,context),
      ],

    );
  }

}
