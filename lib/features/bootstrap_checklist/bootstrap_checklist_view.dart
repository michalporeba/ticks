import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist.dart';
import 'package:ticks/widgets/floating_actions.dart';
import 'package:ticks/widgets/ticks_app_bar.dart';

typedef StagePageBuilder = Widget Function(
  BuildContext,
  BootstrapChecklistState,
);

class BootstrapChecklistPage extends StatelessWidget {
  const BootstrapChecklistPage({super.key});

  static String id = 'bootstrapChecklistView';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BootstrapChecklistBloc, BootstrapChecklistState>(
      builder: _buildViewForStage,
    );
  }

  Widget _buildViewForStage(
    BuildContext context,
    BootstrapChecklistState state,
  ) {
    final stagePageBuilders = <BootstrapChecklistStage, StagePageBuilder>{
      BootstrapChecklistStage.blueprint: _buildViewForBlueprintConfirmation,
    };

    return stagePageBuilders[state.stage]!.call(context, state);
  }

  Widget _buildViewForBlueprintConfirmation(
    BuildContext context,
    BootstrapChecklistState state,
  ) {
    return Scaffold(
      appBar: _createPageAppBar(context, state),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Text(state.checklist!.title),
      ),
      floatingActionButton: FloatingActionButtons(
        actions: [
          FloatingActionData(
            icon: Icons.access_alarm,
            label: 'button',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  AppBar _createPageAppBar(
    BuildContext context,
    BootstrapChecklistState state,
  ) {
    return createAppBar(
      context: context,
      title: 'Start',
    );
  }
}
