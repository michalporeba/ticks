import 'package:ticks/entities/blueprint/blueprint.dart';

abstract class BlueprintApi {
  Future<List<Blueprint>> getAll();
  Future<Blueprint> getBlueprintDetails();
}
