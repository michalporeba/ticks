import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist_bloc.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist_view.dart';
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
            title: 'Choose a check',
            onSearch: (query) {
              BlocProvider
                .of<SelectBlueprintBloc>(context)
                .add(SearchedBlueprints(query));
            },
          ),
          body: Column(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: state.blueprints.map(
                          (blueprint) => BlueprintWidget(
                            data: blueprint,
                            onTap: (blueprint) {
                              BlocProvider
                                .of<BootstrapChecklistBloc>(context)
                                .add(SelectedBlueprint(blueprint: blueprint));

                              Navigator.pushNamed(
                                context,
                                BootstrapChecklistPage.id,);
                            },
                          ),
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
  const BlueprintWidget({
    required this.data,
    required this.onTap,
    super.key,
    });

  final Blueprint data;
  final void Function(Blueprint) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Icon(Icons.checklist),
          ),
          Text(data.title, style: Theme.of(context).textTheme.headlineMedium,),
        ],),
      ),
      onTap: () { onTap(data); },
    );
  }
}
