part of 'bootstrap_checklist_bloc.dart';

sealed class BootstrapChecklistEvent extends Equatable {
  const BootstrapChecklistEvent();

  @override
  List<Object> get props => [];
}

class SelectedBlueprint extends BootstrapChecklistEvent {
  const SelectedBlueprint({required this.blueprint});

  final Blueprint blueprint;

  @override
  List<Object> get props => [blueprint];
}

class ConfirmedBlueprint extends BootstrapChecklistEvent {}
