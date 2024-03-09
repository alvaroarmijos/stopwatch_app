import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/vo/lap.dart';

part 'stopwatch_event.dart';
part 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {
  StopwatchBloc() : super(const StopwatchState()) {
    on<StartTimerEvent>(_onStartTimerEvent);
    on<AddTimeEvent>(_onAddTimeEvent);
    on<StopTimerEvent>(_onStopTimerEvent);
    on<ResetTimerEvent>(_onResetTimerEvent);
    on<AddLapEvent>(_onAddLapEvent);
  }

  Timer? timer;

  FutureOr<void> _onStartTimerEvent(
    StartTimerEvent event,
    Emitter<StopwatchState> emit,
  ) {
    emit(state.copyWith(stopwatchStatus: StopwatchStatus.play));
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
      emit(
        state.copyWith(duration: Duration(seconds: seconds)),
      );
    }
  }

  FutureOr<void> _onStopTimerEvent(
    StopTimerEvent event,
    Emitter<StopwatchState> emit,
  ) {
    emit(state.copyWith(stopwatchStatus: StopwatchStatus.stop));
    timer?.cancel();
  }

  FutureOr<void> _onResetTimerEvent(
    ResetTimerEvent event,
    Emitter<StopwatchState> emit,
  ) {
    emit(
      state.copyWith(
        stopwatchStatus: StopwatchStatus.reset,
        duration: const Duration(),
        laps: const [],
      ),
    );
    timer?.cancel();
  }

  FutureOr<void> _onAddLapEvent(
    AddLapEvent event,
    Emitter<StopwatchState> emit,
  ) {
    final lap = Lap(
      duration: Duration(seconds: event.seconds),
      index: state.laps.length + 1,
    );
    List<Lap> newLaps = [lap, ...state.laps];
    emit(state.copyWith(laps: newLaps));
  }
}
