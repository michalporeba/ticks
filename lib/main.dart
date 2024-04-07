import 'package:flutter/material.dart';
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
        ),
      initialRoute: CurrentCheckListsPage.id,
      routes: {
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


class CurrentCheckListsPage extends StatelessWidget {
  static String id = "currentCheckLists";
  const CurrentCheckListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("SJAC CHECKLISTS"),
        actions: [IconButton(onPressed:(){}, icon: Icon(Icons.settings))]
      ),
      body: const Center(child: Text("The new beginnings")),

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