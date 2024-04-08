part of 'select_blueprint_bloc.dart';

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
