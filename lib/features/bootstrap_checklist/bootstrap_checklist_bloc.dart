import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ticks/entities/blueprint/blueprint.dart';
import 'package:ticks/entities/checklist/checklist.dart';

part 'bootstrap_checklist_event.dart';
part 'bootstrap_checklist_state.dart';

class BootstrapChecklistBloc
extends Bloc<BootstrapChecklistEvent, BootstrapChecklistState> {
  BootstrapChecklistBloc() : super(const BootstrapChecklistState(
    checklist: null,
    stage: BootstrapChecklistStage.blueprint,
  ),) {
    on<SelectedBlueprint>(_onBlueprintSelected);
    on<ConfirmedBlueprint>(_onBlueprintConfirmed);
  }

  Future<void> _onBlueprintSelected(
    SelectedBlueprint event,
    Emitter<BootstrapChecklistState> emit,
  ) async {
    emit(BootstrapChecklistState(
      checklist: Checklist.from(blueprint: event.blueprint),
      stage: BootstrapChecklistStage.blueprint,
    ),);
  }

  Future<void> _onBlueprintConfirmed(
    ConfirmedBlueprint event,
    Emitter<BootstrapChecklistState> emit,
  ) async {
    emit(state.copyWith(stage: BootstrapChecklistStage.resource));
  }
}
