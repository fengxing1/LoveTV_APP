import 'package:json_annotation/json_annotation.dart';

part 'home_detail_model.g.dart';

@JsonSerializable()
class HomeDetailModel {
  String iid;
  String title;
  String img;
  String playtime;
  String otitle;
  String jianjie;
  String daoyan;
  String zhuyan;
  @JsonKey(name: 'list')
  List<SeriesDetailModel> seriesList;
  @JsonKey(name: 'tuijian')
  List<tuijianModel> tuijianList;

  HomeDetailModel(this.iid, this.title, this.img, this.playtime, this.otitle,
      this.jianjie, this.daoyan, this.zhuyan, this.seriesList);
  factory HomeDetailModel.fromJson(Map<String, dynamic> json) => _$HomeDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDetailModelToJson(this);


}

@JsonSerializable()
class SeriesDetailModel{
  String zhuti;
  String down;
  String weburl;
  String bofang;

  SeriesDetailModel(this.zhuti, this.down, this.weburl, this.bofang);
  factory SeriesDetailModel.fromJson(Map<String, dynamic> json) => _$SeriesDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesDetailModelToJson(this);

}


@JsonSerializable()
class tuijianModel {
  String id;
  String title;
  String img;

  tuijianModel(this.id, this.title, this.img);
  factory tuijianModel.fromJson(Map<String, dynamic> json) => _$tuijianModelFromJson(json);

  Map<String, dynamic> toJson() => _$tuijianModelToJson(this);


}