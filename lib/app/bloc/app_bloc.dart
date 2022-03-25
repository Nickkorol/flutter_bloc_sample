import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_sample/repository/repository.dart';
import 'package:flutter_bloc_sample/theme/theme.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required Repository repository})
      : _repository = repository,
        super(AppState(
          counterValue: repository.sharedPreferences.counterValue,
          theme: repository.sharedPreferences.appTheme ?? MyAppTheme.light,
        )) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
    on<AppThemeChanged>(_onAppThemeChanged);
  }

  final Repository _repository;

  // void counterValueIncreased() {
  //   _repository.sharedPreferences.counterValue = state.counterValue + 1;
  //   emit(state.copyWith(counterValue: state.counterValue + 1));
  // }

  void _onIncrement(Increment event, Emitter<AppState> emit) {
    if (event.needsToSave) {
      _repository.sharedPreferences.counterValue = state.counterValue + 1;
    }
    emit(state.copyWith(counterValue: state.counterValue + 1));
  }

  void _onDecrement(Decrement event, Emitter<AppState> emit) {
    if (event.needsToSave) {
      _repository.sharedPreferences.counterValue = state.counterValue - 1;
    }
    emit(state.copyWith(counterValue: state.counterValue - 1));
  }

  void _onAppThemeChanged(AppThemeChanged event, Emitter<AppState> emit) {
    emit(state.copyWith(theme: event.theme));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
