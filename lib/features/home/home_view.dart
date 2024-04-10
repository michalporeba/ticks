import 'package:flutter/material.dart';
import 'package:ticks/features/select_blueprint/select_blueprint.dart';
import 'package:ticks/widgets/ticks_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'currentCheckLists';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(
        context: context,
        title: 'SJAC CHECKS',),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, SelectBlueprintPage.id);
              },
              backgroundColor: Theme.of(context).canvasColor,
              label: const Text('Do something else'),
              icon: const Icon(Icons.question_mark_outlined),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: FloatingActionButton.extended(
              heroTag: null,
              onPressed: () {
                Navigator.pushNamed(context, SelectBlueprintPage.id);
              },
              label: const Text('Start a checklist'),
              icon: const Icon(Icons.start_outlined),
            ),
          ),
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
