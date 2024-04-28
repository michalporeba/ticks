part of 'manage_resources_bloc.dart';

@immutable
class ManageResourcesState extends Equatable {
  const ManageResourcesState({
    this.allResources = const <Resource>[],
    this.resourceTypes = const <ResourceType>[],
    this.query = '',
  });

  final List<Resource> allResources;
  final List<ResourceType> resourceTypes;
  final String query;

  ManageResourcesState copyWith({
    List<Resource>? allResources,
    List<ResourceType>? resourceTypes,
    String? query,
  }) {
    return ManageResourcesState(
      allResources: allResources ?? this.allResources,
      resourceTypes: resourceTypes ?? this.resourceTypes,
      query: query ?? this.query,
    );
  }

  List<Resource> get resources {
    return allResources.where(
      (resource) => resource.matches(query),
    ).toList();
  }

  @override
  List<Object?> get props => [resourceTypes, resources, query];
}
