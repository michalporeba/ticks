import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
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

  @override
  List<Object> get props => [id, org, icon, label, description];
}
