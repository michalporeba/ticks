// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checklist _$ChecklistFromJson(Map<String, dynamic> json) => Checklist(
      blueprintId: json['blueprintId'] as String,
      title: json['title'] as String,
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$ChecklistToJson(Checklist instance) => <String, dynamic>{
      'id': instance.id,
      'blueprintId': instance.blueprintId,
      'title': instance.title,
    };
