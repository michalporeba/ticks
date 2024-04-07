import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/home/home.dart';
import 'package:ticks/theme/theme.dart';
import 'package:ticks_repository/ticks_repository.dart';

class App extends StatelessWidget {
  const App({required this.ticksRepository, super.key});

  final TicksRepository ticksRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: ticksRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlutterTodosTheme.light,
      darkTheme: FlutterTodosTheme.dark,
      //localizationsDelegates: AppLocalizations.localizationsDelegates,
      //supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}