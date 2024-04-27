import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/apis/demo/demo_blueprint_api.dart';
import 'package:ticks/entities/blueprint/blueprint_repository.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist_bloc.dart';
import 'package:ticks/features/home/home_bloc.dart';
import 'package:ticks/features/manage_resources/manage_resources_bloc.dart';
import 'package:ticks/features/select_blueprint/select_blueprint.dart';

List<BlocProvider> createBlocProviders() {
  final demoBlueprintApi = DemoBlueprintApi();

  final blueprintRepository = BlueprintRepository(remoteApi: demoBlueprintApi);

  final blueprintBlocProvider = BlocProvider(
    create: (ctx) => SelectBlueprintBloc(
      blueprintRepository: blueprintRepository,
    ),
  );

  final bootstrapChecklistBlocProvider = BlocProvider(
    create: (ctx) => BootstrapChecklistBloc(),
  );

  final homeBlocProvider = BlocProvider(
    create: (ctx) => HomeBloc(),
  );

  final manageResourceBlocProvider = BlocProvider(
    create: (ctx) => ManageResourcesBloc(),
  );

  return [
    blueprintBlocProvider,
    bootstrapChecklistBlocProvider,
    homeBlocProvider,
    manageResourceBlocProvider,
  ];
}
