import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ticks/entities/json_map.dart';
import 'package:ticks/utils/json_converters/icon_converter.dart';

part 'resource_type.g.dart';

@immutable
@JsonSerializable()
class ResourceType extends Equatable {
  const ResourceType({
    required this.id,
    required this.org,
    required this.icon,
    required this.label,
    required this.description,
  });

  final String id;
  final String org;
  
  @IconConverter()
  final Icon icon;
  final String label;
  final String description;

  static ResourceType fromJson(JsonMap json) => _$ResourceTypeFromJson(json);

  JsonMap toJson() => _$ResourceTypeToJson(this);

  @override
  List<Object> get props => [id, org, icon, label, description];
}
