import 'package:ticks/entities/resource/resource.dart';

abstract class ResourceApi {
  Future<List<Resource>> getAll();
  Future<List<Resource>> getAllOfType(String type);
}
