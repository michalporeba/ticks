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

  Stream<List<Blueprint>> getAll() {
    remoteApi
      .getAll()
      .then((blueprints) => _subject.sink.add(blueprints));

    return _subject.stream;
  }

  Future<List<Blueprint>> getMatching(String query) async {
    return (await _subject.last)
      .where((blueprint) => blueprint.matches(query))
      .toList();
  }

  void dispose() {
    _subject.close();
  }
}
