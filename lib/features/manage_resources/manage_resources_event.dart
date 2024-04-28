part of 'manage_resources_bloc.dart';

sealed class ManageResourcesEvent extends Equatable {
  const ManageResourcesEvent();

  @override
  List<Object> get props => [];
}

class RequestedResources extends ManageResourcesEvent {}

class LoadedManageResources extends ManageResourcesEvent {
  const LoadedManageResources({
    required this.resources,
  });

  final List<Resource> resources;

  @override
  List<Object> get props => [resources];
}

class SearchedResources extends ManageResourcesEvent {
  const SearchedResources(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}
