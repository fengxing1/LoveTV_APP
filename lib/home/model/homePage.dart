import 'package:json_annotation/json_annotation.dart';
import 'package:lovetv_app/home/model/lunbo.dart';
import 'package:lovetv_app/home/model/meiju.dart';


part 'homePage.g.dart';

@JsonSerializable()
class HomePage{
  @JsonKey(name: 'lunbo')
  List<Lunbo> lunboList;
  @JsonKey(name: 'meiju')
  List<Meiju> meijuList;
  @JsonKey(name: 'hanju')
  List<Meiju> hanjuList;
  @JsonKey(name: 'riju')
  List<Meiju> rijuList;

  HomePage(this.lunboList, this.meijuList, this.hanjuList, this.rijuList);

  factory HomePage.fromJson(Map<String, dynamic> json) => _$HomePageFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageToJson(this);


}