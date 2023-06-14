import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_bloc.freezed.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<_Increment>(_increment);
    on<_Decrement>(_decrement);
  }

  void _increment(_, Emitter emit) {
    emit(state + 1);
  }

  void _decrement(_, Emitter emit) {
    if (state == 0) return;

    emit(state - 1);
  }
}
