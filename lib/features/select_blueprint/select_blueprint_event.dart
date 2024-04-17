part of 'select_blueprint_bloc.dart';

sealed class SelectBlueprintEvent extends Equatable {
  const SelectBlueprintEvent();

  @override
  List<Object> get props => [];
}

class LoadedBlueprints extends SelectBlueprintEvent {
  const LoadedBlueprints({required this.blueprints});

  final List<Blueprint> blueprints;

  @override
  List<Object> get props => [blueprints];
}

class SearchedBlueprints extends SelectBlueprintEvent {
  const SearchedBlueprints(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}
