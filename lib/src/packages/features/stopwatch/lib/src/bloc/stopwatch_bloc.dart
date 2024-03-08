import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stopwatch_event.dart';
part 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {
  StopwatchBloc() : super(const StopwatchState()) {
    on<StartTimerEvent>(_onStartTimerEvent);
    on<AddTimeEvent>(_onAddTimeEvent);
    on<StopTimerEvent>(_onStopTimerEvent);
  }

  Timer? timer;

  FutureOr<void> _onStartTimerEvent(
    StartTimerEvent event,
    Emitter<StopwatchState> emit,
  ) {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => add(const AddTimeEvent()),
    );
  }

  FutureOr<void> _onAddTimeEvent(
    AddTimeEvent event,
    Emitter<StopwatchState> emit,
  ) {
    const addSeconds = 1;
    final seconds = state.duration.inSeconds + addSeconds;
    if (seconds < 0) {
      timer?.cancel();
    } else {
      emit(state.copyWith(duration: Duration(seconds: seconds)));
    }
  }

  FutureOr<void> _onStopTimerEvent(
    StopTimerEvent event,
    Emitter<StopwatchState> emit,
  ) {
    timer?.cancel();
  }
}
