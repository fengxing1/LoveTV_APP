import 'package:flutter/material.dart';
import 'package:lovetv_app/home/model/meiju.dart';
import 'package:lovetv_app/home/model/home_detail_model.dart';
import 'package:lovetv_app/dao/home_dao.dart';
import 'package:lovetv_app/dao/dao_result.dart';
import 'package:lovetv_app/utils/navigator_utils.dart';

class HomeDetail extends StatefulWidget {
  static final String sName = "homeDetail";
  final Meiju meiju;
  bool bNetWorkData = false;
  HomeDetailModel homeDetailModel;

  HomeDetail(this.meiju);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    homeDetailModel = HomeDetailModel('4773', '本能第二季', 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2561538317.jpg',
        '20', 'Killer Instinct/Dr. Death', '12', '234', '324dcss', [SeriesDetailModel('第六集', 'www.baidu.com', 'www.baidu.com', 'www.baidu.com')]);
    homeDetailModel.tuijianList = [tuijianModel('3782', '无心面对', 'https://pic.yefu365.com/uploads/allimg/171101/96b55ca335c92ba4.jpg'),
      tuijianModel('3782', '无心面对', 'https://pic.yefu365.com/uploads/allimg/171101/96b55ca335c92ba4.jpg'),
      tuijianModel('3782', '无心面对', 'https://pic.yefu365.com/uploads/allimg/171101/96b55ca335c92ba4.jpg'),
      tuijianModel('3782', '无心面对', 'https://pic.yefu365.com/uploads/allimg/171101/96b55ca335c92ba4.jpg'),
      tuijianModel('3782', '无心面对', 'https://pic.yefu365.com/uploads/allimg/171101/96b55ca335c92ba4.jpg'),
      tuijianModel('3782', '联邦调查局第一季', 'https://pic.yefu365.com/uploads/allimg/201807/be8131466a1acfdc.jpg')];
    return _homeDetailState();
  }

}




class _homeDetailState extends State<HomeDetail> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPage() async {
      DataResult resultData = await HomeDao.getTVDetail(widget.meiju.id);
      widget.homeDetailModel = HomeDetailModel.fromJson(resultData.data);
      setState(() {
        widget.bNetWorkData = true;

      });
    }
    requestPage();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text('详情页'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _BuildImageWidget(),
            _TVTitleWidget(),
            _SeriesWidget(),
            _TVCard(),
          ],
        ),
      ),
    );
  }


  //查看剧集
  void _SeeSeries(SeriesDetailModel seriesDetailModel){
    print(seriesDetailModel.zhuti);
    NavigatorUtils.goTVPlay(context, seriesDetailModel);

  }

  Widget _SeriesWidget() {
    return Container(
      height: 40,
      child: ListView.builder(
          itemBuilder: (BuildContext context,int index){
            return Container(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: RaisedButton(
                onPressed: () {
                  _SeeSeries(widget.homeDetailModel.seriesList[index]);
                },
                child: Text(widget.homeDetailModel.seriesList[index].zhuti),
                color: Colors.white,
              ),
            );
          },
        itemCount: widget.homeDetailModel.seriesList.length,
        padding: new EdgeInsets.all(5.0),
        scrollDirection: Axis.horizontal,
      ),
    );
}

  Widget _BuildImageWidget() {
    return Container(
        height: 200,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Image.network(
          widget.bNetWorkData?widget.homeDetailModel.img:widget.meiju.img,
          fit: BoxFit.cover,
          width: double.maxFinite,
        ),
    );
  }

  Widget _TVCard() {
    return Column(
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.only(left: 10),
          height: 50,
          child: new Row(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(left: 10),
                child:new Text('相关推荐') ,
              )
            ],

          ),
        ),
        _BuildGrid(),
      ],

    );
  }

  void _handleTap(BuildContext context,tuijianModel tuijian) {
    NavigatorUtils.goTVDetail(context,Meiju(tuijian.id, tuijian.title, null, null, null, null, null, null, tuijian.img));


  }

  List<Container> _buildGridTileList() {
    return new List<Container>.generate(
        widget.homeDetailModel.tuijianList.length,
            (int index) =>
        new Container(
          child: new GestureDetector(
            onTap: (){
              _handleTap(context, widget.homeDetailModel.tuijianList[index]);
            },
            child: new Column(
              children: <Widget>[
                Expanded(child:
                Image.network(
                  widget.homeDetailModel.tuijianList[index].img,
                  fit: BoxFit.cover,

                ),
                ),
                new Container(
                  height: 30,
                  padding: const EdgeInsets.only(top: 5),
                  child: new Text(
                    widget.homeDetailModel.tuijianList[index].title,
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


  Widget _BuildGrid(){
    return new GridView.extent(
      shrinkWrap: true,
      physics:NeverScrollableScrollPhysics(),
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(5.0),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      childAspectRatio: 0.6,
      children:_buildGridTileList(),
    );
  }

  Widget _TVTitleWidget () {
    return new Container(
      height: 110,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 10,top: 10),
                    child: Text(widget.meiju.title,
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10,top: 10),
                    child: Text('更新至${widget.meiju.zhuti}|2.8万次播放',
                      style: TextStyle(fontSize: 14,color: Colors.grey),),
                  ),

                ],
              ) ),
              Container(
                padding: const EdgeInsets.only(right: 10),
                child:Row(
                  children: <Widget>[
                    Text('简介',
                        style: TextStyle(fontSize: 14,color: Colors.grey)
                    ),
                    Icon(Icons.navigate_next,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),

            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 15,top: 10),
            height: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(Icons.star_border,size: 28),
                ),
                Icon(Icons.file_download,size: 28,),
              ],
            ),
          )
        ],
      ),
    );

  }
  
}

