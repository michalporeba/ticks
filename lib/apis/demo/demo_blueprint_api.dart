import 'dart:convert';
import 'dart:io';
import 'package:ticks/entities/blueprint/blueprint.dart';
import 'package:ticks/entities/blueprint/blueprint_api.dart';
import 'package:ticks/entities/json_map.dart';

class DemoBlueprintApi implements BlueprintApi {
  @override
  Future<Blueprint> getBlueprintDetails() async {
    throw UnimplementedError();
  }

  @override
  Stream<Blueprint> getBlueprints() async* {
    final directory = Directory('blueprints');

    await for (final file in directory.list()) {
      if (file is! File) {
        continue;
      }

      final data = await file.readAsString();
      final jsonData = json.decode(data) as JsonMap;
      yield Blueprint.fromJson(jsonData);
    }
  }

}