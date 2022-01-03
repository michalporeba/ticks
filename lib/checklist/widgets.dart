import 'package:flutter/material.dart';
import 'package:ticks/checklist/provider.dart';
import 'check.dart';
import 'checklist.dart';
import 'check.dart' as m;

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
      itemCount: checklist.checks.length,
      itemBuilder: (context, index) {
          Check check = checklist.checks[index];
          return SimpleCheck(model: check as m.SimpleCheck);
      }
    );
  }
}


class SimpleCheck extends StatelessWidget {
  final m.SimpleCheck model;
  SimpleCheck({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(model.label, style: Theme.of(context).textTheme.headline5)),
            const Checkbox(value: false, onChanged: null)
          ],
        ),
        const Divider()
      ],
    );
  }
}
