import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:ticks/entities/blueprint/blueprint.dart';
import 'package:ticks/entities/blueprint/blueprint_repository.dart';

part 'select_blueprint_event.dart';
part 'select_blueprint_state.dart';

class SelectBlueprintBloc
extends Bloc<SelectBlueprintEvent, SelectBlueprintState> {

  SelectBlueprintBloc({
    required this.blueprintRepository,
  }) : super(const SelectBlueprintState()) {
    on<LoadedBlueprints>(_onLoad);
    on<SearchedBlueprints>(_onSearch);
    on<RequestedBlueprints>(_onRequested);

    blueprintRepository.getBlueprints().listen((blueprints) {
      add(LoadedBlueprints(blueprints: blueprints));
    });
  }

  final BlueprintRepository blueprintRepository;

  Future<void> _onRequested(
    RequestedBlueprints event,
    Emitter<SelectBlueprintState> emit,
  ) async {
    emit(state.copyWith(query: ''));
  }

  Future<void> _onLoad(
    LoadedBlueprints event,
    Emitter<SelectBlueprintState> emit,
  ) async {
    final orderedBlueprints = event.blueprints
                                   .toList()
                                   ..sort((a, b) => a.title.compareTo(b.title));

    emit(state.copyWith(
      allBlueprints: orderedBlueprints,
    ),);
  }

  Future<void> _onSearch(
    SearchedBlueprints event,
    Emitter<SelectBlueprintState> emit,
  ) async {
    emit(state.copyWith(
      query: event.query,
    ),);
  }
}
