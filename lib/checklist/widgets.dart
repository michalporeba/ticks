import 'package:flutter/material.dart';
import 'package:ticks/checklist/provider.dart';
import 'check.dart';
import 'checklist.dart';

class CheckList extends StatefulWidget {
  const CheckList({Key? key}) : super(key: key);

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  final Checklist checklist = SampleChecklistProvider().get('test');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd && i < checklist.checks.length * 2) { return const Divider(); }

        final int index = i ~/2;

        if (index < checklist.checks.length) {
          Check check = checklist.checks[index];
          return Text(check.label, style: Theme.of(context).textTheme.headline5);
        }

        return Container();
      }
    );
  }
}


class SimpleCheck extends StatelessWidget {
  const SimpleCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
