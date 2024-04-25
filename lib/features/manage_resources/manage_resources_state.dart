part of 'manage_resources_bloc.dart';

@immutable
class ManageResourcesState extends Equatable {
  const ManageResourcesState({
    this.resources = const <Resource>[],
    this.resourceTypes = const <ResourceType>[],
  });

  final List<Resource> resources;
  final List<ResourceType> resourceTypes;

  ManageResourcesState copyWith({
    List<Resource>? resources,
    List<ResourceType>? resourceTypes,
  }) {
    return ManageResourcesState(
      resources: resources ?? this.resources,
      resourceTypes: resourceTypes ?? this.resourceTypes,
    );
  }

  @override
  List<Object?> get props => [resourceTypes, resources];
}
