import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {

  String userId;
  String userName;
  List loveTV;
  List searchTV;
  List<Map<String,int>> screenTVList;

  User(this.userId, this.userName,{ this.loveTV, this.searchTV,
    this.screenTVList});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}
