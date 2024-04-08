import 'dart:convert';

import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticks_api/ticks_api.dart';

/// {@template local_ticks_api}
/// local implementation of the ticks API
/// {@endtemplate}
class LocalTicksApi extends TicksApi {
  /// {@macro local_ticks_api}
  LocalTicksApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  final _blueprintsStreamController
    = BehaviorSubject<List<Blueprint>>.seeded(const []);
  final _checklistsStreamController
    = BehaviorSubject<List<Checklist>>.seeded(const []);

  static const blueprintsCollectionKey = '__blueprints_collection_key__';
  static const checklistsCollectionKey = '__checklists_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);
  // ignore: unused_element
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    final blueprintsJson = _getValue(blueprintsCollectionKey);
    if (blueprintsJson != null) {
      final blueprints = List<Map<dynamic, dynamic>>.from(
        json.decode(blueprintsJson) as List,
      )
          .map((json) => Blueprint.fromJson(Map<String, dynamic>.from(json)))
          .toList();
          _blueprintsStreamController.add(blueprints);
    }

    final checklistsJson = _getValue(checklistsCollectionKey);
    if (checklistsJson != null) {
      final checklists = List<Map<dynamic, dynamic>>.from(
        json.decode(checklistsJson) as List,
      )
          .map((json) => Checklist.fromJson(Map<String, dynamic>.from(json)))
          .toList();
          _checklistsStreamController.add(checklists);
    }
  }

  @override
  Stream<List<Checklist>> getActiveChecklists()
  => _checklistsStreamController.asBroadcastStream();

  @override
  Stream<List<Blueprint>> getBlueprints()
  => _blueprintsStreamController.asBroadcastStream();
}
