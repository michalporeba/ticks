part of 'select_blueprint_bloc.dart';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:ticks_domain/ticks_domain.dart';

@immutable
class SelectBlueprintState extends Equatable {
  const SelectBlueprintState({
    this.blueprints = const [],
    this.selectedBlueprint,
  });

  final List<Blueprint> blueprints;
  final Blueprint? selectedBlueprint;

  SelectBlueprintState copyWith({
    List<Blueprint>? blueprints,
    Blueprint? selectedBlueprint,
  }) {
    return SelectBlueprintState(
      blueprints: blueprints ?? this.blueprints,
      selectedBlueprint: selectedBlueprint ?? this.selectedBlueprint,
    );
  }

  @override
  List<Object?> get props => [blueprints, selectedBlueprint];
}