// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['userId'] as String,
    json['userName'] as String,
    loveTV: json['loveTV'] as List,
    searchTV: json['searchTV'] as List,
    screenTVList: (json['screenTVList'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, e as int),
            ))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'loveTV': instance.loveTV,
      'searchTV': instance.searchTV,
      'screenTVList': instance.screenTVList,
    };
