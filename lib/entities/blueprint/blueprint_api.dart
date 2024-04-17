import 'package:ticks/entities/blueprint/blueprint.dart';

abstract class BlueprintApi {
  Future<List<Blueprint>> getBlueprints();
  Future<Blueprint> getBlueprintDetails();
}
