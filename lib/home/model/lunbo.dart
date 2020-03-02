import 'package:json_annotation/json_annotation.dart';

part 'lunbo.g.dart';

@JsonSerializable()
class Lunbo{
  String id;
  String title;
  String img;

  Lunbo(this.id, this.title, this.img);


  factory Lunbo.fromJson(Map<String, dynamic> json) => _$LunboFromJson(json);

  Map<String, dynamic> toJson() => _$LunboToJson(this);

}