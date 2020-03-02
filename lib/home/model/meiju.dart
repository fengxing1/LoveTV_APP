import 'package:json_annotation/json_annotation.dart';


part 'meiju.g.dart';

@JsonSerializable()
class Meiju {
  String id;
  String title;
  String otitle;
  String zhuyan;
  String daoyan;
  String m3u8;
  String playtime;
  String zhuti;
  String img;

  Meiju(this.id, this.title, this.otitle, this.zhuyan, this.daoyan, this.m3u8,
      this.playtime, this.zhuti, this.img);

  factory Meiju.fromJson(Map<String, dynamic> json) => _$MeijuFromJson(json);

  Map<String, dynamic> toJson() => _$MeijuToJson(this);

}