import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ticks/entities/resource/resource_type.dart';
import 'package:ticks/features/manage_resources/manage_resources.dart';

part 'manage_resources_event.dart';
part 'manage_resources_state.dart';

class ManageResourcesBloc
extends Bloc<ManageResourcesEvent, ManageResourcesState> {
  ManageResourcesBloc() : super(const ManageResourcesState()) {
    on<LoadedManageResources>(_onLoad);
  }

  Future<void> _onLoad(
    LoadedManageResources event,
    Emitter<ManageResourcesState> emit,
  ) async {
    emit(state);
  }
}
