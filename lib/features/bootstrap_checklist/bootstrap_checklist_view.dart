import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist.dart';
import 'package:ticks/features/bootstrap_checklist/widgets/blueprint_confirmation.dart';
import 'package:ticks/features/bootstrap_checklist/widgets/resource_selection.dart';

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

  // TODO(michal): can this be inlined?
  Widget _buildViewForStage(
    BuildContext context,
    BootstrapChecklistState state,
  ) {
    final stagePageBuilders = <BootstrapChecklistStage, StagePageBuilder>{
      BootstrapChecklistStage.blueprint: blueprintConfirmationView,
      BootstrapChecklistStage.resource: resourceSelectionView,
    };

    return stagePageBuilders[state.stage]!.call(context, state);
  }
}
