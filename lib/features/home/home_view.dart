import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/features/home/home.dart';
import 'package:ticks/features/select_blueprint/select_blueprint.dart';
import 'package:ticks/widgets/floating_actions.dart';
import 'package:ticks/widgets/ticks_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'currentCheckLists';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: createAppBar(
            context: context,
            title: 'SJAC CHECKS',),
          body: _createBody(context, state),
          floatingActionButton: FloatingActionButtons(
            actions: [
              FloatingActionData(
                icon: Icons.checklist,
                label: 'Start a checklist',
                onPressed: () {
                  Navigator.pushNamed(context, SelectBlueprintPage.id);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _createBody(BuildContext context, HomeState state) {
    if (state.checklist == null) {
      return _nothingToSee(context);
    }
    return const Placeholder();
  }

  Widget _nothingToSee(BuildContext context) {
    return const Center(
        child: Text('You do not have any open checklists'),);
  }
}
