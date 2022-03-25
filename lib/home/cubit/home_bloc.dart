import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_sample/app/bloc/app_bloc.dart';
import 'package:flutter_bloc_sample/repository/repository.dart';
import 'package:flutter_bloc_sample/theme/theme.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Repository repository;
  final AppBloc appBloc;

  HomeCubit({required this.repository, required this.appBloc})
      : super(HomeState());

  void incrementCounter() {
    appBloc.add(const Increment(needsToSave: true));
  }

  void decrementCounter() {
    appBloc.add(const Decrement(needsToSave: false));
  }

  void changeTheme(MyAppTheme theme) {
    appBloc.add(AppThemeChanged(theme: theme));
  }
}
