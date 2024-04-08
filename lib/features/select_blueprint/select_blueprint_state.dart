part of 'select_blueprint_bloc.dart';

@immutable
class SelectBlueprintState extends Equatable {
  const SelectBlueprintState({
    this.blueprints = const [],
    this.isFiltered = false,
  });

  final List<Blueprint> blueprints;
  final bool isFiltered;

  SelectBlueprintState copyWith({
    List<Blueprint>? blueprints,
    bool? isFiltered,
  }) {
    return SelectBlueprintState(
      blueprints: blueprints ?? this.blueprints,
      isFiltered: isFiltered ?? this.isFiltered,
    );
  }

  @override
  List<Object?> get props => [blueprints, isFiltered];
}
