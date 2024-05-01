// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceType _$ResourceTypeFromJson(Map<String, dynamic> json) => ResourceType(
      id: json['id'] as String,
      org: json['org'] as String,
      icon: const IconConverter().fromJson(json['icon'] as String),
      label: json['label'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ResourceTypeToJson(ResourceType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org': instance.org,
      'icon': const IconConverter().toJson(instance.icon),
      'label': instance.label,
      'description': instance.description,
    };
