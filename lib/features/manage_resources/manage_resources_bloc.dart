import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ticks/entities/resource/resource_repository.dart';
import 'package:ticks/entities/resource/resource_type.dart';
import 'package:ticks/features/manage_resources/manage_resources.dart';

part 'manage_resources_event.dart';
part 'manage_resources_state.dart';

class ManageResourcesBloc
    extends Bloc<ManageResourcesEvent, ManageResourcesState> {
  ManageResourcesBloc({
    required this.resourceRepository,
  }) : super(const ManageResourcesState()) {
    on<LoadedManageResources>(_onLoad);
    on<SearchedResources>(_onSearch);
    on<RequestedResources>(_onRequested);

    resourceRepository.getAll().listen((resources) {
      add(LoadedManageResources(resources: resources));
    });
  }

  final ResourceRepository resourceRepository;

  Future<void> _onRequested(
    RequestedResources event,
    Emitter<ManageResourcesState> emit,
  ) async {
    emit(state.copyWith(query: ''));
  }

  Future<void> _onLoad(
    LoadedManageResources event,
    Emitter<ManageResourcesState> emit,
  ) async {
    final orderedResources = event.resources.toList()
      ..sort((a, b) => a.label.compareTo(b.label));

    emit(state.copyWith(
      allResources: orderedResources,
    ),);
  }

  Future<void> _onSearch(
    SearchedResources event,
    Emitter<ManageResourcesState> emit,
  ) async {
    emit(
      state.copyWith(
        query: event.query,
      ),
    );
  }
}
