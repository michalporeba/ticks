part of 'select_blueprint_bloc.dart';

@immutable
class SelectBlueprintState extends Equatable {
  const SelectBlueprintState({
    this.allBlueprints = const [],
    this.query = '',
  });

  final List<Blueprint> allBlueprints;
  final String query;

  SelectBlueprintState copyWith({
    List<Blueprint>? allBlueprints,
    String? query,
  }) {
    return SelectBlueprintState(
      allBlueprints: allBlueprints ?? this.allBlueprints,
      query: query ?? this.query,
    );
  }

  List<Blueprint> get blueprints {
    return allBlueprints.where(
        (blueprint) => blueprint.matches(query),
        ).toList();
  }

  @override
  List<Object?> get props => [blueprints, query];
}
