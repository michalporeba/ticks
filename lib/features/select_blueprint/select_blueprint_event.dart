part of 'select_blueprint_bloc.dart';

sealed class SelectBlueprintEvent extends Equatable {
  const SelectBlueprintEvent();

  @override
  List<Object> get props => [];
}

class RequestedBlueprints extends SelectBlueprintEvent {}