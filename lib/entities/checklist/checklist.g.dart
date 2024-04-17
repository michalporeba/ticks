// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checklist _$ChecklistFromJson(Map<String, dynamic> json) => Checklist(
      blueprint: Blueprint.fromJson(json['blueprint'] as Map<String, dynamic>),
      id: json['id'] as String,
      org: json['org'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$ChecklistToJson(Checklist instance) => <String, dynamic>{
      'org': instance.org,
      'id': instance.id,
      'blueprint': instance.blueprint,
      'title': instance.title,
    };
