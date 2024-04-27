import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/apis/demo/demo_blueprint_api.dart';
import 'package:ticks/app/app_theme.dart';
import 'package:ticks/entities/blueprint/blueprint_repository.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist_bloc.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist_view.dart';
import 'package:ticks/features/home/home.dart';
import 'package:ticks/features/manage_resources/manage_resources.dart';
import 'package:ticks/features/select_blueprint/select_blueprint.dart';

void main() {
  final demoBlueprintApi = DemoBlueprintApi();

  final blueprintRepository = BlueprintRepository(remoteApi: demoBlueprintApi);

  final blueprintBlocProvider = BlocProvider(
    create: (ctx) => SelectBlueprintBloc(
      blueprintRepository: blueprintRepository,
    ),
  );

  final bootstrapChecklistBlocProvider = BlocProvider(
    create: (ctx) => BootstrapChecklistBloc(),
  );

  final homeBlocProvider = BlocProvider(
    create: (ctx) => HomeBloc(),
  );

  final manageResourceBlocProvider = BlocProvider(
    create: (ctx) => ManageResourcesBloc(),
  );

  runApp(
    AppWithProviders(
      app: const TicksApp(),
      blocProviders: [
        // globally accessible blocs
        blueprintBlocProvider,
        bootstrapChecklistBlocProvider,
        homeBlocProvider,
        manageResourceBlocProvider,
      ],
      repositoryProviders: const [],
    ),
  );
}

class AppWithProviders extends StatelessWidget {
  const AppWithProviders({
    required this.app,
    required this.blocProviders,
    required this.repositoryProviders,
    super.key,
  });

  final List<BlocProvider<dynamic>> blocProviders;
  final List<RepositoryProvider<dynamic>> repositoryProviders;
  final Widget app;

  @override
  Widget build(BuildContext context) {
    return
        //MultiRepositoryProvider(
        //providers: repositoryProviders,
        //child:
        MultiBlocProvider(
      providers: blocProviders,
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
