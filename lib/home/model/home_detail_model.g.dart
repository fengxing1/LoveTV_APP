// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDetailModel _$HomeDetailModelFromJson(Map<String, dynamic> json) {
  return HomeDetailModel(
    json['iid'] as String,
    json['title'] as String,
    json['img'] as String,
    json['playtime'] as String,
    json['otitle'] as String,
    json['jianjie'] as String,
    json['daoyan'] as String,
    json['zhuyan'] as String,
    (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : SeriesDetailModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..tuijianList = (json['tuijian'] as List)
      ?.map((e) =>
          e == null ? null : tuijianModel.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$HomeDetailModelToJson(HomeDetailModel instance) =>
    <String, dynamic>{
      'iid': instance.iid,
      'title': instance.title,
      'img': instance.img,
      'playtime': instance.playtime,
      'otitle': instance.otitle,
      'jianjie': instance.jianjie,
      'daoyan': instance.daoyan,
      'zhuyan': instance.zhuyan,
      'list': instance.seriesList,
      'tuijian': instance.tuijianList,
    };

SeriesDetailModel _$SeriesDetailModelFromJson(Map<String, dynamic> json) {
  return SeriesDetailModel(
    json['zhuti'] as String,
    json['down'] as String,
    json['weburl'] as String,
    json['bofang'] as String,
  );
}

Map<String, dynamic> _$SeriesDetailModelToJson(SeriesDetailModel instance) =>
    <String, dynamic>{
      'zhuti': instance.zhuti,
      'down': instance.down,
      'weburl': instance.weburl,
      'bofang': instance.bofang,
    };

tuijianModel _$tuijianModelFromJson(Map<String, dynamic> json) {
  return tuijianModel(
    json['id'] as String,
    json['title'] as String,
    json['img'] as String,
  );
}

Map<String, dynamic> _$tuijianModelToJson(tuijianModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
    };
