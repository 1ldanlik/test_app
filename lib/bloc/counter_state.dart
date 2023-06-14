part of 'counter_bloc.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState({
    @Default(0) int counter,
}) = _CounterState;
}

// flutter pub run build_runner build --delete-conflicting-outputs