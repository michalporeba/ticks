import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_blueprint_event.dart';
part 'select_blueprint_state.dart';

class SelectBlueprintBloc extends Bloc<SelectBlueprintEvent, SelectBlueprintState> {
  SelectBlueprintBloc() : super(const SelectBlueprintState());

}