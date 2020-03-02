// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homePage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePage _$HomePageFromJson(Map<String, dynamic> json) {
  return HomePage(
    (json['lunbo'] as List)
        ?.map(
            (e) => e == null ? null : Lunbo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['meiju'] as List)
        ?.map(
            (e) => e == null ? null : Meiju.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['hanju'] as List)
        ?.map(
            (e) => e == null ? null : Meiju.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['riju'] as List)
        ?.map(
            (e) => e == null ? null : Meiju.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomePageToJson(HomePage instance) => <String, dynamic>{
      'lunbo': instance.lunboList,
      'meiju': instance.meijuList,
      'hanju': instance.hanjuList,
      'riju': instance.rijuList,
    };
