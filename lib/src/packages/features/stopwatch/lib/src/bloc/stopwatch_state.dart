part of 'stopwatch_bloc.dart';

final class StopwatchState extends Equatable {
  const StopwatchState({
    this.duration = const Duration(),
  });

  final Duration duration;

  StopwatchState copyWith({
    final Duration? duration,
  }) =>
      StopwatchState(
        duration: duration ?? this.duration,
      );

  @override
  List<Object?> get props => [duration];
}
