import 'package:ticks/entities/blueprint/blueprint.dart';

class BlueprintRepository {
  Stream<List<Blueprint>> getBlueprints() {
    return Stream.fromIterable([
      [
        Blueprint(title: 'Ambulance'),
        Blueprint(title: 'Handheld radio'),
      ],
    ]);
  }
}
