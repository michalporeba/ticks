import 'package:ticks/entities/resource/resource.dart';
import 'package:ticks/entities/resource/resource_type.dart';

abstract class ResourceApi {
  Future<List<Resource>> getAll();
  Future<List<Resource>> getAllOfType(String type);
  Future<List<ResourceType>> getResourceTypes(String org);
}
