import 'dart:async';
import 'package:rxdart/subjects.dart';
import 'package:ticks/entities/blueprint/blueprint.dart';
import 'package:ticks/entities/blueprint/blueprint_api.dart';

class BlueprintRepository {

  BlueprintRepository({
    required this.remoteApi,
  });

  final _subject = BehaviorSubject<List<Blueprint>>();

  final BlueprintApi remoteApi;

  Stream<List<Blueprint>> getBlueprints() {
    remoteApi
      .getBlueprints()
      .then((blueprints) => _subject.sink.add(blueprints));

    return _subject.stream;
  }

  void dispose() {
    _subject.close();
  }
}
