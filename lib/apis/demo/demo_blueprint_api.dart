import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:ticks/entities/blueprint/blueprint.dart';
import 'package:ticks/entities/blueprint/blueprint_api.dart';

class DemoBlueprintApi implements BlueprintApi {
  @override
  Future<Blueprint> getBlueprintDetails() async {
    throw UnimplementedError();
  }

  @override
  Future<List<Blueprint>> getAll() async {
    final jsonString = await rootBundle.loadString('lib/apis/demo/data/blueprints.json');

    final blueprints = List<Map<dynamic, dynamic>>.from(
        json.decode(jsonString) as List,
    )
    .map((json) => Blueprint.fromJson(Map<String, dynamic>.from(json)))
    .toList();

    return blueprints;
  }
}
