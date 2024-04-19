import 'package:flutter/material.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist_bloc.dart';
import 'package:ticks/features/bootstrap_checklist/widgets/app_bar.dart';
import 'package:ticks/widgets/floating_actions.dart';

Widget blueprintConfirmationView(
  BuildContext context,
  BootstrapChecklistState state,
) {
  return Scaffold(
    appBar: createPageAppBar(context, state),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'confirm your selection',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ValueDisplay(
            label: 'selected check',
            value: state.checklist!.blueprint.title,
          ),
          ValueDisplay(
            label: 'description',
            value: state.checklist!.blueprint.description,
          ),
          ValueDisplay(
            label: 'version',
            value: state.checklist!.blueprint.version,
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButtons(
      actions: [
        FloatingActionData(
          icon: Icons.check_circle_outline,
          label: 'Confirm',
          onPressed: () {},
        ),
        FloatingActionData(
          icon: Icons.cancel,
          label: 'Cancel',
          onPressed: () { Navigator.pop(context); },
        ),
      ],
    ),
  );
}

class ValueDisplay extends StatelessWidget {
  const ValueDisplay({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child:
        InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: const UnderlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
          ),
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
    );
  }
}
