import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticks/apis/demo/demo_blueprint_api.dart';
import 'package:ticks/apis/demo/demo_resource_api.dart';
import 'package:ticks/entities/blueprint/blueprint_repository.dart';
import 'package:ticks/entities/resource/resource_repository.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist_bloc.dart';
import 'package:ticks/features/home/home_bloc.dart';
import 'package:ticks/features/manage_resources/manage_resources_bloc.dart';
import 'package:ticks/features/select_blueprint/select_blueprint.dart';

List<BlocProvider> createBlocProviders() {
  final demoBlueprintApi = DemoBlueprintApi();
  final demoResourceApi = DemoResourceApi();

  final blueprintRepository = BlueprintRepository(remoteApi: demoBlueprintApi);
  final resourceRepository = ResourceRepository(remoteApi: demoResourceApi);

  final blueprintBlocProvider = BlocProvider(
    create: (context) => SelectBlueprintBloc(
      blueprintRepository: blueprintRepository,
    ),
  );

  final bootstrapChecklistBlocProvider = BlocProvider(
    create: (context) => BootstrapChecklistBloc(),
  );

  final homeBlocProvider = BlocProvider(
    create: (context) => HomeBloc(),
  );

  final manageResourceBlocProvider = BlocProvider(
    create: (context) => ManageResourcesBloc(
      resourceRepository: resourceRepository,
    ),
  );

  return [
    blueprintBlocProvider,
    bootstrapChecklistBlocProvider,
    homeBlocProvider,
    manageResourceBlocProvider,
  ];
}
