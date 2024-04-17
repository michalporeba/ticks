import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ticks/entities/json_map.dart';

part 'blueprint.g.dart';

@immutable
@JsonSerializable()
class Blueprint extends Equatable {
  /// {@macro blueprint}
  const Blueprint({
    required this.org,
    required this.id,
    required this.title,
    this.description = '',
    this.version = '0.0.0',
  });

  final String org;
  final String id;
  final String title;
  final String description;
  final String version;

  /// {@macro blueprint}
  Blueprint copyWith({
    String? title,
    String? description,
    String? version,
  }) {
    return Blueprint(
      org: org,
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      version: version ?? this.version,
    );
  }

  bool matches(String query) {
    if (query.isEmpty) return true;

    final pattern = RegExp(r'\b' + RegExp.escape(query.toLowerCase()));
    return pattern.hasMatch(title.toLowerCase());
  }

  static Blueprint fromJson(JsonMap json) => _$BlueprintFromJson(json);

  /// Converts this [Blueprint] into a [JsonMap].
  JsonMap toJson() => _$BlueprintToJson(this);

  @override
  List<Object> get props => [id, title, description, version];
}
