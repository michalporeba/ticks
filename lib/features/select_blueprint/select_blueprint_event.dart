part of 'select_blueprint_bloc.dart';

sealed class SelectBlueprintEvent extends Equatable {
  const SelectBlueprintEvent();

  @override
  List<Object> get props => [];
}

class LoadedSelectBlueprint extends SelectBlueprintEvent {}
class SearchedBlueprints extends SelectBlueprintEvent {
  const SearchedBlueprints(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}
