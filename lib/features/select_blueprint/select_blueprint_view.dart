import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/features/select_blueprint/select_blueprint.dart';
import 'package:ticks/widgets/floating_actions.dart';
import 'package:ticks/widgets/ticks_app_bar.dart';

class SelectBlueprintPage extends StatelessWidget {

  const SelectBlueprintPage({super.key});
  static String id = 'startAChecklistView';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectBlueprintBloc, SelectBlueprintState>(
      builder: (context, state) {
        return Scaffold(
          appBar: createAppBar(
            context: context,
            title: 'Start a checklist',
            onSearch: (query) {},
          ),
          body: Column(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: state.blueprints.map(
                          (item) => BlueprintWidget(data: item),
                  ).toList(),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButtons(
            actions: [
              FloatingActionData(
                icon: Icons.camera_alt_outlined,
                label: 'Scan a QR code',
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}

class BlueprintWidget extends StatelessWidget {
  const BlueprintWidget({required this.data, super.key});

  final Blueprint data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Icon(Icons.checklist),
        ),
        Text(data.title, style: Theme.of(context).textTheme.headlineMedium,),
      ],),
    );
  }
}
