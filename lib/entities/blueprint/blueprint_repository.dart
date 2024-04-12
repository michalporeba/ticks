import 'package:ticks/entities/blueprint/blueprint.dart';
import 'package:uuid/uuid.dart';

class BlueprintRepository {
  final Stream<List<Blueprint>> _stream = Stream.fromIterable(
      [_testData().toList()],
    );

  Stream<List<Blueprint>> getBlueprints() => _stream;
}

Iterable<Blueprint> _testData() sync* {
  const uuid = Uuid();
  yield Blueprint(id: uuid.v4(), title: 'Ambulance');
  yield Blueprint(id: uuid.v4(), title: 'Responder Bag');
  yield Blueprint(id: uuid.v4(), title: 'Radio');
}
