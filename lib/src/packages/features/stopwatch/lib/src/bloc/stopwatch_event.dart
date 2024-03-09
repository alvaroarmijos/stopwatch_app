part of 'stopwatch_bloc.dart';

sealed class StopwatchEvent extends Equatable {
  const StopwatchEvent();

  @override
  List<Object?> get props => [];
}

final class StartTimerEvent extends StopwatchEvent {
  const StartTimerEvent();
}

final class AddTimeEvent extends StopwatchEvent {
  const AddTimeEvent();
}

final class StopTimerEvent extends StopwatchEvent {
  const StopTimerEvent();
}

final class ResetTimerEvent extends StopwatchEvent {
  const ResetTimerEvent();
}

final class AddLapEvent extends StopwatchEvent {
  const AddLapEvent(this.seconds);

  final int seconds;
}
