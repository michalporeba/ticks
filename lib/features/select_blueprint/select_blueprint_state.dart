part of 'select_blueprint_bloc.dart';

@immutable
class SelectBlueprintState extends Equatable {
  const SelectBlueprintState({
    this.blueprints = const [],
    this.query = '',
  });

  final List<Blueprint> blueprints;
  final String query;

  SelectBlueprintState copyWith({
    List<Blueprint>? blueprints,
    String? query,
  }) {
    return SelectBlueprintState(
      blueprints: blueprints ?? this.blueprints,
      query: query ?? this.query,
    );
  }

  List<Blueprint> get filteredBlueprints {
    return blueprints.where(
        (blueprint) => blueprint.matches(query),
        ).toList();
  }

  @override
  List<Object?> get props => [blueprints, query];
}
