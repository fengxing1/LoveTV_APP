// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meiju.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meiju _$MeijuFromJson(Map<String, dynamic> json) {
  return Meiju(
    json['id'] as String,
    json['title'] as String,
    json['otitle'] as String,
    json['zhuyan'] as String,
    json['daoyan'] as String,
    json['m3u8'] as String,
    json['playtime'] as String,
    json['zhuti'] as String,
    json['img'] as String,
  );
}

Map<String, dynamic> _$MeijuToJson(Meiju instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'otitle': instance.otitle,
      'zhuyan': instance.zhuyan,
      'daoyan': instance.daoyan,
      'm3u8': instance.m3u8,
      'playtime': instance.playtime,
      'zhuti': instance.zhuti,
      'img': instance.img,
    };
