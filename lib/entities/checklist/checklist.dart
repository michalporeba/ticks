import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ticks/entities/blueprint/blueprint.dart';
import 'package:ticks/entities/json_map.dart';
import 'package:uuid/uuid.dart';

part 'checklist.g.dart';

@immutable
@JsonSerializable()
class Checklist extends Equatable {
  /// {@macro checklist}
  const Checklist({
    required this.blueprint,
    required this.id,
    required this.org,
    required this.title,
  });

  factory Checklist.from({
    required Blueprint blueprint,
  }) {
    return Checklist(
      blueprint: blueprint,
      id: const Uuid().v4(),
      org: blueprint.org,
      title: blueprint.title,
    );
  }

  final String org;
  final String id;
  final Blueprint blueprint;
  final String title;

  Checklist copyWith({
    String? title,
  }) {
    return Checklist(
      org: org,
      id: id,
      blueprint: blueprint,
      title: title ?? this.title,
    );
  }

  static Checklist fromJson(JsonMap json) => _$ChecklistFromJson(json); 
  JsonMap toJson() => _$ChecklistToJson(this);

  @override
  List<Object> get props => [org, id, blueprint, title];
}
