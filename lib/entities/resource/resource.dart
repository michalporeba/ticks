import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ticks/entities/json_map.dart';

part 'resource.g.dart';

@immutable
@JsonSerializable()
class Resource extends Equatable {
  const Resource({
    required this.id,
    required this.label,
    required this.org,
    required this.types,
  });

  final String id;
  final String label;
  final String org;
  final List<String> types;

  Resource copyWith({
    String? label,
    List<String>? types,
  }) {
    return Resource(
      id: id,
      label: label ?? this.label,
      org: org,
      types: types ?? this.types,
    );
  }

  static Resource fromJson(JsonMap json) => _$ResourceFromJson(json);

  JsonMap toJson() => _$ResourceToJson(this);

  @override
  List<Object> get props => [id, org, label, types];
}
