part of 'home_cubit.dart';

enum HomeTab { todos, stats }

final class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.todos,
    this.text = 'Hello,',
  });

  final HomeTab tab;
  final String text;

  @override
  List<Object> get props => [tab, text];
}
