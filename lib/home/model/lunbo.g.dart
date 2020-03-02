// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lunbo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lunbo _$LunboFromJson(Map<String, dynamic> json) {
  return Lunbo(
    json['id'] as String,
    json['title'] as String,
    json['img'] as String,
  );
}

Map<String, dynamic> _$LunboToJson(Lunbo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
    };
