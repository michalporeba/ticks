import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ticks/entities/blueprint/blueprint.dart';

part 'bootstrap_checklist_event.dart';
part 'bootstrap_checklist_state.dart';

class BootstrapChecklistBloc
extends Bloc<BootstrapChecklistEvent, BootstrapChecklistState> {
  BootstrapChecklistBloc() : super(const BootstrapChecklistState()) {
    on<SelectedBlueprint>(_onChecklistSelected);
  }

  Future<void> _onChecklistSelected(
    SelectedBlueprint event,
    Emitter<BootstrapChecklistState> emit,
  ) async {
    emit(const BootstrapChecklistState());
  }
}
