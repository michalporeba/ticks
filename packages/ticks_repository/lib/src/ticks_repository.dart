import 'package:ticks_api/ticks_api.dart';
import 'package:ticks_api/blueprint.dart';

/// {@template ticks_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class TicksRepository {
  /// {@macro ticks_repository}
  const TicksRepository({
    required TicksApi ticksApi,
  }) : _ticksApi = ticksApi;

  final TicksApi _ticksApi;

  Stream<List<Checklist>> getActiveChecklists() => _ticksApi.getActiveChecklists();
  Stream<List<Blueprint>> getBlueprints() => _ticksApi.getBlueprints();
}