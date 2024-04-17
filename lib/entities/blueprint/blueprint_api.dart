import 'package:ticks/entities/blueprint/blueprint.dart';

abstract class BlueprintApi {
  Stream<Blueprint> getBlueprints();
  Future<Blueprint> getBlueprintDetails();
}
