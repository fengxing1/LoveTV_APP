import 'package:flutter/material.dart';
import 'package:lovetv_app/home/model/home_detail_model.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class HomeTVPlay extends StatefulWidget {
  final SeriesDetailModel seriesDetailModel;


  HomeTVPlay(this.seriesDetailModel);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeTVPlayState();

  }

}

class HomeTVPlayState extends State<HomeTVPlay> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.seriesDetailModel.bofang);
    videoPlayerController = VideoPlayerController.network(widget.seriesDetailModel.bofang);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );

  }


  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: new Text('详情页'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Chewie(controller: chewieController,),
            ),
          ],
        ),
//      body: Container(
//          alignment: Alignment.topLeft,
////          decoration: BoxDecoration(
////          ),
////          constraints: BoxConstraints.expand(
////            height: MediaQuery.of(context).size.height,
////          ),
//          child: Chewie(
//              controller: chewieController
//          )
//      ),
    );
  }

}