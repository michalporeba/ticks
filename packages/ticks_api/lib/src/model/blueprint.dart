import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'json_map.dart';

part 'blueprint.g.dart';

@immutable
@JsonSerializable()
class Blueprint extends Equatable {
  /// {@macro blueprint}
  const Blueprint({
    String? id,
    required this.title,
    this.description = '',
    this.version = '0.0.0',
  }) : assert(
    id == null ,
    "Blueprint's ID must either be null or not empty",
  ), this.id = id ?? "";

  final String id;
  final String title;
  final String description;
  final String version;

  /// {@macro blueprint}
  Blueprint copyWith({
    String? id,
    String? title,
    String? description,
    String? version,
  }) {
    return Blueprint(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      version: version ?? this.version,
    );
  }

  static Blueprint fromJson(JsonMap json) => _$BlueprintFromJson(json);

  /// Converts this [Blueprint] into a [JsonMap].
  JsonMap toJson() => _$BlueprintToJson(this);

  @override
  List<Object> get props => [id, title, description, version];
}
