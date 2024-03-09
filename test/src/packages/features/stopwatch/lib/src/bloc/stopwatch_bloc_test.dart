import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/bloc/stopwatch_bloc.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/vo/lap.dart';

void main() {
  late StopwatchBloc stopwatchBloc;

  setUp(() {
    stopwatchBloc = StopwatchBloc();
  });

  test('Initial state should be reset', () {
    expect(stopwatchBloc.state.stopwatchStatus, StopwatchStatus.reset);
  });

  group('StartTimerEvent', () {
    blocTest<StopwatchBloc, StopwatchState>(
      'emits [StopwatchState(stopwatchStatus: StopwatchStatus.play)] when StartTimerEvent is added.',
      build: () => StopwatchBloc(),
      act: (bloc) => bloc.add(const StartTimerEvent()),
      expect: () => const <StopwatchState>[
        StopwatchState(stopwatchStatus: StopwatchStatus.play)
      ],
    );
  });

  group('AddTimeEvent', () {
    blocTest<StopwatchBloc, StopwatchState>(
      'emits [StopwatchState(duration: Duration)] when AddTimeEvent is added.',
      build: () => StopwatchBloc(),
      act: (bloc) => bloc.add(const AddTimeEvent()),
      expect: () => const <StopwatchState>[
        StopwatchState(duration: Duration(seconds: 1))
      ],
    );
  });

  group('StopTimerEvent', () {
    blocTest<StopwatchBloc, StopwatchState>(
      'emits [StopwatchState(stopwatchStatus: StopwatchStatus.stop)] when StopTimerEvent is added.',
      build: () => StopwatchBloc(),
      act: (bloc) => bloc.add(const StopTimerEvent()),
      expect: () => const <StopwatchState>[
        StopwatchState(stopwatchStatus: StopwatchStatus.stop)
      ],
    );
  });

  group('ResetTimerEvent', () {
    blocTest<StopwatchBloc, StopwatchState>(
      'emits [StopwatchState()] when ResetTimerEvent is added.',
      build: () => StopwatchBloc(),
      act: (bloc) => bloc.add(const ResetTimerEvent()),
      expect: () => const <StopwatchState>[StopwatchState()],
    );
  });

  group('AddLapEvent', () {
    blocTest<StopwatchBloc, StopwatchState>(
      'emits [StopwatchState(laps: newLaps)] when AddLapEvent is added.',
      build: () => StopwatchBloc(),
      act: (bloc) => bloc.add(const AddLapEvent(1)),
      expect: () => const <StopwatchState>[
        StopwatchState(laps: [
          Lap(
            duration: Duration(seconds: 1),
            index: 1,
          )
        ])
      ],
    );
  });
}
