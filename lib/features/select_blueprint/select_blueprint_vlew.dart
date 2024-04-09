import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/entities/blueprint/blueprint.dart';
import 'package:ticks/features/select_blueprint/select_blueprint_bloc.dart';

class StartAChecklistView extends StatelessWidget {

  const StartAChecklistView({super.key});
  static String id = 'startAChecklistView';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<SelectBlueprintBloc, SelectBlueprintState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              'Start a checklist',
              style: textTheme.headlineMedium,
            ),
            actions: [IconButton(
              onPressed:(){},
              icon: const Icon(Icons.settings),),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(64),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(4),
                      child: const Icon(Icons.filter_alt_outlined),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: state.blueprints.map(
                            (item) => BlueprintWidget(data: item),
                    ).toList(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white
                ),
                child: const Text("Hello"),
              ),
              const SizedBox(height: 16,),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            tooltip: 'Start a checklist',
            icon: const Icon(Icons.add),
            label: const Text('test'),
          ),
        );
      }
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
        Text(data.title, style: Theme.of(context).textTheme.bodyLarge,),
      ],),
    );
  }
}
