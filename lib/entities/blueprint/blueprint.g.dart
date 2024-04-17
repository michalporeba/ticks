// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blueprint _$BlueprintFromJson(Map<String, dynamic> json) => Blueprint(
      org: json['org'] as String,
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      version: json['version'] as String? ?? '0.0.0',
    );

Map<String, dynamic> _$BlueprintToJson(Blueprint instance) => <String, dynamic>{
      'org': instance.org,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'version': instance.version,
    };
