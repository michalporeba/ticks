part of 'manage_resources_bloc.dart';

sealed class ManageResourcesEvent extends Equatable {
  const ManageResourcesEvent();

  @override
  List<Object> get props => [];
}

class LoadedManageResources extends ManageResourcesEvent {}
