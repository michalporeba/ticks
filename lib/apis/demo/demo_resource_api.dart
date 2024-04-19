import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:ticks/entities/resource/resource.dart';
import 'package:ticks/entities/resource/resource_api.dart';

class DemoResourceApi implements ResourceApi {
  @override
  Future<List<Resource>> getAll() async {
    final jsonString = await rootBundle.loadString('lib/apis/demo/data/blueprints.json');

    final resources = List<Map<dynamic, dynamic>>.from(
        json.decode(jsonString) as List,
    )
    .map((json) => Resource.fromJson(Map<String, dynamic>.from(json)))
    .toList();

    return resources;
  }

  @override
  Future<List<Resource>> getAllOfType(String type) async {
    return (await getAll())
      .where((element) => element.types.contains(type.toLowerCase()))
      .toList();
  }
}
