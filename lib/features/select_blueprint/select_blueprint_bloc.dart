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
  }

  final BlueprintRepository blueprintRepository;

  Future<void> _onLoad(
    LoadedSelectBlueprint event,
    Emitter<SelectBlueprintState> emit,
  ) async {
    print('onLoad');
    blueprintRepository.getBlueprints().listen(
      (blueprints) {
        emit(state.copyWith(
          blueprints: blueprints,
          ),
        );
      },
    );
  }
}
