import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

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
  final Icon icon;
  final String label;
  final String description;

  static ResourceType fromJson(JsonMap json) => _$ResourceTypeFromJson(json);

  JsonMap toJson() => _$ResourceTypeToJson(this);

  @override
  List<Object> get props => [id, org, icon, label, description];
}
