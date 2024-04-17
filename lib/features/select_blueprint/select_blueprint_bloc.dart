import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ticks/entities/blueprint/blueprint.dart';
import 'package:ticks/entities/blueprint/blueprint_repository.dart';

part 'select_blueprint_event.dart';
part 'select_blueprint_state.dart';

class SelectBlueprintBloc
extends Bloc<SelectBlueprintEvent, SelectBlueprintState> {

  SelectBlueprintBloc({
    required this.blueprintRepository,
  }) : super(const SelectBlueprintState()) {
    on<LoadedSelectBlueprint>(_onLoad);
    on<SearchedBlueprints>(_onSearch);
    add(LoadedSelectBlueprint());
  }

  final BlueprintRepository blueprintRepository;

  Future<void> _onLoad(
    LoadedSelectBlueprint event,
    Emitter<SelectBlueprintState> emit,
  ) async {
    blueprintRepository.getBlueprints().listen(
      (blueprints) {
        emit(state.copyWith(
          blueprints: blueprints,
          ),
        );
      },
    );
  }

  Future<void> _onSearch(
    SearchedBlueprints event,
    Emitter<SelectBlueprintState> emit,
  ) async {
    blueprintRepository.getBlueprints().listen(
      (blueprints) {
        emit(state.copyWith(
          blueprints: blueprints.where(
            (blueprint) => blueprint.matchesQuery(event.query),
          ).toList(),
          ),
        );
      },
    );
  }
}
