import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_ticks_api/local_ticks_api.dart';
import 'package:ticks/bootstrap.dart';
import 'checklist/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      title: "Checklists",
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme(
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
        CurrentCheckListsPage.id: (context) => const CurrentCheckListsPage()
      }
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
  static String id = "startAChecklist";

  const StartAChecklistView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("Start a new checklist", style: textTheme.headlineLarge),
            actions: [IconButton(onPressed:(){}, icon: Icon(Icons.settings))],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(64.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Container(
                      margin: EdgeInsets.all(4),
                      child: Icon(Icons.filter_alt_outlined)
                    )
                  ),
                ),
              )
        ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Blueprint(title: "Ambulance check"),
                Blueprint(title: "Radio check"),
                Blueprint(title: "Response bag check")
              ],

            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Start a checklist',
          child: const Icon(Icons.add),
        )
    );
  }
}



class CurrentCheckListsPage extends StatelessWidget {
  static String id = "currentCheckLists";
  const CurrentCheckListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("SJAC CHECKLISTS", style: textTheme.headlineLarge),
        actions: [IconButton(onPressed:(){}, icon: Icon(Icons.settings))]
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            OpenChecklists(),
            SizedBox(height: 16.0),
            SuggestedBlueprints(),
          ],

        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Start a checklist',
        child: const Icon(Icons.add),
      )
    );
  }
}

class Checklist extends StatelessWidget {
  const Checklist({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.check_box_outlined),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.check_box_outline_blank),
            ),
            Text(this.title, style: Theme.of(context).textTheme.bodyLarge)
          ]
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
        Text("Open Checklists", style: Theme.of(context).textTheme.headlineMedium,),
        Checklist(title: "Ambulance HK 105"),
        Checklist(title: "Handheld radio HK 423")
      ],
    );
  }
}

class Blueprint extends StatelessWidget {
  const Blueprint({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Icon(Icons.checklist),
        ),
        Text(this.title, style: Theme.of(context).textTheme.bodyLarge,),
      ]),
    );
  }
}

class SuggestedBlueprints extends StatelessWidget {
  const SuggestedBlueprints({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Suggested cheklists", style: Theme.of(context).textTheme.headlineMedium,),
        Blueprint(title: "Report an issue"),
        Blueprint(title: "Log a radio check")
      ]
    );
  }
}





class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CHECKLISTS"),
      ),
      body: const Center(
          child: CheckList()
      ),
    );
  }
}