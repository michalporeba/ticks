import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/app/app_theme.dart';

import 'package:ticks/features/select_blueprint/select_blueprint_bloc.dart';
import 'package:ticks/features/select_blueprint/select_blueprint_vlew.dart';

void main() {
  // TODO(michal): repositories will have to be created here.
  // they will have to be provided to TicksApp through the constructor.
  final selectBlueprintBlocProvider = BlocProvider(
    create: (ctx) => SelectBlueprintBloc()..add(RequestedBlueprints()),
  );

  runApp(AppWithProviders(
    app: const TicksApp(),
    blocProviders: [ // globally accessible blocs
      selectBlueprintBlocProvider,
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


// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   final ticksApi = LocalTicksApi(
//     plugin: await SharedPreferences.getInstance(),
//   );
//
//   bootstrap(ticksApi: ticksApi);
// }

class TicksApp extends StatelessWidget {
  const TicksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklists',
      theme: AppTheme.sjac(context),
      initialRoute: StartAChecklistView.id,
      routes: {
        StartAChecklistView.id: (context) => const StartAChecklistView(),
        CurrentCheckListsPage.id: (context) => const CurrentCheckListsPage(),
      },
    );
  }
}

class CurrentCheckListsPage extends StatelessWidget {
  const CurrentCheckListsPage({super.key});
  static String id = 'currentCheckLists';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('SJAC CHECKLISTS', style: textTheme.headlineLarge),
        actions: [IconButton(onPressed:(){}, icon: const Icon(Icons.settings))],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            OpenChecklists(),
            SizedBox(height: 16),
            SuggestedBlueprints(),
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Start a checklist',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Checklist extends StatelessWidget {
  const Checklist({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.check_box_outlined),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.check_box_outline_blank),
            ),
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
          ],
      ),
    );
  }
}

class OpenChecklists extends StatelessWidget {
  const OpenChecklists({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Open Checklists',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Checklist(title: 'Ambulance HK 105'),
        const Checklist(title: 'Handheld radio HK 423'),
      ],
    );
  }
}

class SuggestedBlueprints extends StatelessWidget {
  const SuggestedBlueprints({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Suggested cheklists',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        //const BlueprintWidget(title: 'Report an issue'),
        //const BlueprintWidget(title: 'Log a radio check'),
      ],
    );
  }
}
