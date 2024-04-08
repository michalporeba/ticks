import 'package:ticks/entities/blueprint/blueprint.dart';

abstract class BlueprintApi {
  Stream<List<Blueprint>> getBlueprints();
}
