import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ticks/entities/blueprint/blueprint.dart';

part 'select_blueprint_event.dart';
part 'select_blueprint_state.dart';

class SelectBlueprintBloc
extends Bloc<SelectBlueprintEvent, SelectBlueprintState> {
  
  SelectBlueprintBloc() : super(const SelectBlueprintState()) {
    on<RequestedBlueprints>(_onLoadBlueprints);
  }

  Future<void> _onLoadBlueprints(
    RequestedBlueprints event,
    Emitter<SelectBlueprintState> emit,
  ) async {
    emit(state.copyWith(
      blueprints: [
        const Blueprint(
          id: '1',
          title: 'Ambulance',
        ),
        const Blueprint(
          id: '2',
          title: 'Responder Bag',
        ),
        const Blueprint(
          id: '3',
          title: 'Radio',
        ),
      ],
    ),);
  }
}
