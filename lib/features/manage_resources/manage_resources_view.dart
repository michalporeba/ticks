import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/features/manage_resources/manage_resources_bloc.dart';
import 'package:ticks/widgets/floating_actions.dart';
import 'package:ticks/widgets/ticks_app_bar.dart';

class ManageResourcesPage extends StatelessWidget {
  const ManageResourcesPage({super.key});
  static String id = 'currentCheckLists';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageResourcesBloc, ManageResourcesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: createAppBar(
            context: context,
          ),
          body: _createBody(context, state),
          floatingActionButton: FloatingActionButtons(
            actions: [
              FloatingActionData(
                icon: Icons.checklist,
                label: 'resources',
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _createBody(BuildContext context, ManageResourcesState state) {
    if (state.resources.isEmpty) {
      return _nothingToSee(context);
    }
    return const Placeholder();
  }

  Widget _nothingToSee(BuildContext context) {
    return const Center(
        child: Text('You do not have any resources yet.'),);
  }
}
