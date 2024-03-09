part of 'stopwatch_bloc.dart';

enum StopwatchStatus { stop, play, reset }

final class StopwatchState extends Equatable {
  const StopwatchState({
    this.duration = const Duration(),
    this.stopwatchStatus = StopwatchStatus.reset,
    this.laps = const [],
  });

  final Duration duration;
  final StopwatchStatus stopwatchStatus;
  final List<Lap> laps;

  bool get showStopFlagButton =>
      stopwatchStatus == StopwatchStatus.play ||
      stopwatchStatus == StopwatchStatus.stop;

  bool get isStoped => stopwatchStatus == StopwatchStatus.stop;

  bool get canStart =>
      stopwatchStatus == StopwatchStatus.stop ||
      stopwatchStatus == StopwatchStatus.reset;

  StopwatchState copyWith({
    final Duration? duration,
    final StopwatchStatus? stopwatchStatus,
    final List<Lap>? laps,
  }) =>
      StopwatchState(
        duration: duration ?? this.duration,
        stopwatchStatus: stopwatchStatus ?? this.stopwatchStatus,
        laps: laps ?? this.laps,
      );

  @override
  List<Object?> get props => [duration, stopwatchStatus, laps];
}
