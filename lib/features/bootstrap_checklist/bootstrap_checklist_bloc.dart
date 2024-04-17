import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bootstrap_checklist_event.dart';
part 'bootstrap_checklist_state.dart';

class BootstrapChecklistBloc
extends Bloc<BootstrapChecklistEvent, BootstrapChecklistState> {
  BootstrapChecklistBloc() : super(const BootstrapChecklistState());
}
