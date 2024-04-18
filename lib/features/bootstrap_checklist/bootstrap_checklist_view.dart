import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist.dart';
import 'package:ticks/widgets/floating_actions.dart';
import 'package:ticks/widgets/ticks_app_bar.dart';

class BootstrapChecklistPage extends StatelessWidget {
  const BootstrapChecklistPage({super.key});

  static String id = 'bootstrapChecklistView';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BootstrapChecklistBloc, BootstrapChecklistState>(
      builder: (context, state) {
        return Scaffold(
          appBar: createAppBar(
            context: context,
            title: 'Start',
          ),
          body: const SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Text('hello'),
          ),
          floatingActionButton: FloatingActionButtons(
            actions: [
              FloatingActionData(
                icon: Icons.access_alarm,
                label: 'button',
                onPressed: (){},
              ),
            ],),
        );
      },
    );
  }
}
