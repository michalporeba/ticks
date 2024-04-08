import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklists',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              background: Color(0xfffff7ab),
              onBackground: Color(0xff222222),
              surface: Color(0xfffff7ab),
              onSurface: Color(0xff222222),
              error: Colors.red,
              onError: Colors.white,
              primary: Color(0xfffeb605),
              onPrimary: Color(0xff000000),
              secondary: Color(0xff03a475),
              onSecondary: Color(0xffffffff),

          ),
          textTheme: GoogleFonts.heeboTextTheme(),
        ),
      initialRoute: StartAChecklistView.id,
      routes: {
        StartAChecklistView.id: (context) => const StartAChecklistView(),
        CurrentCheckListsPage.id: (context) => const CurrentCheckListsPage(),
      },
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class StartAChecklistView extends StatelessWidget {

  const StartAChecklistView({super.key});
  static String id = 'startAChecklist';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              'Start a new checklist',
              style: textTheme.headlineLarge,
            ),
            actions: [IconButton(
              onPressed:(){},
              icon: const Icon(Icons.settings),),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(64),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(4),
                      child: const Icon(Icons.filter_alt_outlined),
                    ),
                  ),
                ),
              ),
        ),
        ),
        body: const SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Blueprint(title: 'Ambulance check'),
                Blueprint(title: 'Radio check'),
                Blueprint(title: 'Response bag check'),
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

class Blueprint extends StatelessWidget {
  const Blueprint({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Icon(Icons.checklist),
        ),
        Text(title, style: Theme.of(context).textTheme.bodyLarge,),
      ],),
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
        const Blueprint(title: 'Report an issue'),
        const Blueprint(title: 'Log a radio check'),
      ],
    );
  }
}
