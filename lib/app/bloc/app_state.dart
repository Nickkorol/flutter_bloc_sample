part of 'app_bloc.dart';

class AppState extends Equatable {
  final int counterValue;
  final MyAppTheme theme;

  const AppState({required this.counterValue, required this.theme});

  AppState copyWith({int? counterValue, MyAppTheme? theme}) {
    return AppState(
        counterValue: counterValue ?? this.counterValue,
        theme: theme ?? this.theme);
  }

  @override
  List<Object> get props => [counterValue, theme];
}
