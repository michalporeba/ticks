import 'package:ticks_api/src/model/blueprint.dart';

import 'model/checklist.dart';

/// {@template ticks_api}
/// The interfaces and model for the API providing access to ticks
/// {@endtemplate}
abstract class TicksApi {
  /// {@macro ticks_api}
  const TicksApi();

  Stream<List<Checklist>> getActiveChecklists();

  Stream<List<Blueprint>> getBlueprints();
}
