// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
      id: json['id'] as String,
      label: json['label'] as String,
      org: json['org'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'org': instance.org,
      'types': instance.types,
    };
