import 'package:flutter/material.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist_bloc.dart';
import 'package:ticks/features/bootstrap_checklist/widgets/app_bar.dart';

Widget resourceSelectionView(
  BuildContext context,
  BootstrapChecklistState state,
) {
  return Scaffold(
      appBar: createPageAppBar(context, state),
      body: SingleChildScrollView(
        //padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'select the ambulance',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
}
