part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.currentChecklist,
  });

  final Checklist? currentChecklist;

  HomeState copyWith({
    Checklist? currentChecklist,
  }) {
    return HomeState(
      currentChecklist: currentChecklist ?? this.currentChecklist,
    );
  }

  @override
  List<Object?> get props => [currentChecklist];
}