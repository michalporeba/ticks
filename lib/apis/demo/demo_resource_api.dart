import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:ticks/entities/resource/resource.dart';
import 'package:ticks/entities/resource/resource_api.dart';
import 'package:ticks/entities/resource/resource_type.dart';

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

  @override
  Future<List<ResourceType>> getResourceTypes(String org) async {
    final jsonString = await rootBundle.loadString('lib/apis/demo/data/resource_types.json');

    final resourceTypes = List<Map<dynamic, dynamic>>.from(
        json.decode(jsonString) as List,
    )
    .map((json) => ResourceType.fromJson(Map<String, dynamic>.from(json)))
    .toList();

    return resourceTypes;
  }
}
