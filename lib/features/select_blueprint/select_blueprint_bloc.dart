import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ticks_domain/ticks_domain.dart';

part 'select_blueprint_event.dart';
part 'select_blueprint_state.dart';

class SelectBlueprintBloc
extends Bloc<SelectBlueprintEvent, SelectBlueprintState> {
  
  SelectBlueprintBloc() : super(const SelectBlueprintState()) {
    on<LoadBlueprints>(_onLoadBlueprints);
  }

  Future<void> _onLoadBlueprints(
    LoadBlueprints event,
    Emitter<SelectBlueprintState> emit,
  ) async {
    emit(state.copyWith(
      blueprints: [
        Blueprint(
          id: '1',
          title: 'Blueprint 1',
        ),
        Blueprint(
          id: '2',
          title: 'Blueprint 2',
        ),
      ],
    ),);
  }
}
