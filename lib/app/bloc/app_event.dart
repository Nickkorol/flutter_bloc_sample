part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppThemeChanged extends AppEvent {
  final MyAppTheme theme;

  const AppThemeChanged({required this.theme});
}

class Increment extends AppEvent {
  final bool needsToSave;

  const Increment({required this.needsToSave});
}

class Decrement extends AppEvent {
  final bool needsToSave;

  const Decrement({required this.needsToSave});
}
