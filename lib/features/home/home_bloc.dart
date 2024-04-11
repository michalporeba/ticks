import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ticks/entities/checklist/checklist.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc
extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadedHome>(_onLoad);
  }

  Future<void> _onLoad(
    LoadedHome event,
    Emitter<HomeState> emit,
  ) async {
    emit(state);
  }
}
