part of 'bootstrap_checklist_bloc.dart';

enum BootstrapChecklistStage {
  blueprint,
  resource,
  reason,
  individual,
  confirmation
}

@immutable
class BootstrapChecklistState extends Equatable {
  const BootstrapChecklistState({
    required this.checklist,
    required this.stage,
  });

  final Checklist? checklist;
  final BootstrapChecklistStage stage;

  BootstrapChecklistState copyWith({
    Checklist? checklist,
    BootstrapChecklistStage? stage,
  }) {
    return BootstrapChecklistState(
      checklist: checklist ?? this.checklist,
      stage: stage ?? this.stage,
    );
  }

  @override
  List<Object?> get props => [checklist, stage];
}
