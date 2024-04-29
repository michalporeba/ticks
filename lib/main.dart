import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/app/app_theme.dart';
import 'package:ticks/app/bloc_providers.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist_view.dart';
import 'package:ticks/features/home/home.dart';
import 'package:ticks/features/manage_resources/manage_resources.dart';
import 'package:ticks/features/select_blueprint/select_blueprint.dart';

void main() {
  runApp(
    const AppWithProviders(
      app: TicksApp(),
      repositoryProviders: [],
    ),
  );
}

class AppWithProviders extends StatelessWidget {
  const AppWithProviders({
    required this.app,
    required this.repositoryProviders,
    super.key,
  });

  final List<RepositoryProvider<dynamic>> repositoryProviders;
  final Widget app;

  @override
  Widget build(BuildContext context) {
    return
        //MultiRepositoryProvider(
        //providers: repositoryProviders,
        //child:
        MultiBlocProvider(
      providers: createBlocProviders(),
      child: app,
      //),
    );
  }
}

class TicksApp extends StatelessWidget {
  const TicksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklists',
      theme: AppTheme.sjac(context),
      initialRoute: ManageResourcesPage.id,
      routes: {
        BootstrapChecklistPage.id: (context) => const BootstrapChecklistPage(),
        HomePage.id: (context) => const HomePage(),
        SelectBlueprintPage.id: (context) => const SelectBlueprintPage(),
        ManageResourcesPage.id: (context) => const ManageResourcesPage(),
      },
    );
  }
}
