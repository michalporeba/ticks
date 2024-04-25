part of 'manage_resources_bloc.dart';

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.checklist,
    this.checklists = const <Checklist>[],
  });

  final Checklist? checklist;
  final List<Checklist> checklists;

  HomeState copyWith({
    Checklist? checklist,
    List<Checklist>? checklists,
  }) {
    return HomeState(
      checklist: checklist ?? this.checklist,
      checklists: checklists ?? this.checklists,
    );
  }

  @override
  List<Object?> get props => [checklist, checklists];
}
