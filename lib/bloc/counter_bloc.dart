import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_event.dart';

part 'counter_state.dart';

part 'counter_bloc.freezed.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<_Increment>(_increment);
    on<_Decrement>(_decrement);
  }

  void _increment(_Increment event, Emitter emit) {
    emit(state.copyWith(
      counter: state.counter + 1,
    ));
  }

  void _decrement(_Decrement event, Emitter emit) {
    if (state.counter == 0) return;

    emit(state.copyWith(
      counter: state.counter - 1,
    ));
  }
}
