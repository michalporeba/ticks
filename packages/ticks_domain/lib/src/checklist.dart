import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ticks_domain/src/json_map.dart';

part 'checklist.g.dart';

@immutable
@JsonSerializable()
class Checklist extends Equatable {
  /// {@macro checklist}
  const Checklist({
    required this.blueprintId,
    required this.title,
    this.id = '',
  });

  final String id;
  final String blueprintId;
  final String title;

  Checklist copyWith({
    String? id,
    String? blueprintId,
    String? title,
  }) {
    return Checklist(
      id: id ?? this.id,
      blueprintId: blueprintId ?? this.blueprintId,
      title: title ?? this.title,
    );
  }

  static Checklist fromJson(JsonMap json) => _$ChecklistFromJson(json); 
  JsonMap toJson() => _$ChecklistToJson(this);

  @override
  List<Object> get props => [id, blueprintId, title];
}