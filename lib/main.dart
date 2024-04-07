import 'package:flutter/material.dart';
import 'checklist/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Checklists",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: CurrentCheckListsPage.id,
      routes: {
        CurrentCheckListsPage.id: (context) => const CurrentCheckListsPage()
      }
    );
  }
}

class CurrentCheckListsPage extends StatelessWidget {
  static String id = "currentCheckLists";
  const CurrentCheckListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SJAC CHECKLISTS")),
      body: const Center(child: Text("The new beginnings"))
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