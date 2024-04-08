// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blueprint _$BlueprintFromJson(Map<String, dynamic> json) => Blueprint(
      title: json['title'] as String,
      id: json['id'] as String?,
      description: json['description'] as String? ?? '',
      version: json['version'] as String? ?? '0.0.0',
    );

Map<String, dynamic> _$BlueprintToJson(Blueprint instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'version': instance.version,
    };
