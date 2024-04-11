import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/app/app_theme.dart';
import 'package:ticks/features/home/home.dart';
import 'package:ticks/features/home/home_view.dart';
import 'package:ticks/features/select_blueprint/select_blueprint.dart';

void main() {
  // TODO(michal): repositories will have to be created here.
  // they will have to be provided to TicksApp through the constructor.
  final blueprintBlocProvider = BlocProvider(
    create: (ctx) => SelectBlueprintBloc()..add(RequestedBlueprints()),
  );

  final homeBlocProvider = BlocProvider(
    create: (ctx) => HomeBloc()
  );

  runApp(AppWithProviders(
    app: const TicksApp(),
    blocProviders: [ // globally accessible blocs
      blueprintBlocProvider,
      homeBlocProvider,
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
      initialRoute: HomePage.id,
      routes: {
        SelectBlueprintPage.id: (context) => const SelectBlueprintPage(),
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}
