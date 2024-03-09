import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/bloc/stopwatch_bloc.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/vo/lap.dart';

void main() {
  group('StopwatchState', () {
    test('supports value comparision', () {
      expect(const StopwatchState(), const StopwatchState());
    });

    test('returns same object when no properties are passed', () {
      expect(const StopwatchState().copyWith(), const StopwatchState());
    });

    test('returns object with updated status when stopwatchStatus is passed',
        () {
      expect(
        const StopwatchState().copyWith(stopwatchStatus: StopwatchStatus.play),
        const StopwatchState(stopwatchStatus: StopwatchStatus.play),
      );
    });

    test('returns object with updated status when duration is passed', () {
      expect(
        const StopwatchState().copyWith(duration: const Duration(seconds: 1)),
        const StopwatchState(duration: Duration(seconds: 1)),
      );
    });

    test('returns object with updated status when laps is passed', () {
      expect(
        const StopwatchState()
            .copyWith(laps: [const Lap(duration: Duration(), index: 0)]),
        const StopwatchState(laps: [Lap(duration: Duration(), index: 0)]),
      );
    });
  });

  group('showStopFlagButton', () {
    test('should return true', () {
      expect(
        const StopwatchState(stopwatchStatus: StopwatchStatus.play)
            .showStopFlagButton,
        true,
      );
    });

    test('should return false', () {
      expect(
        const StopwatchState(stopwatchStatus: StopwatchStatus.reset)
            .showStopFlagButton,
        false,
      );
    });
  });

  group('isStoped', () {
    test('should return true', () {
      expect(
        const StopwatchState(stopwatchStatus: StopwatchStatus.stop).isStoped,
        true,
      );
    });

    test('should return false', () {
      expect(
        const StopwatchState(stopwatchStatus: StopwatchStatus.reset).isStoped,
        false,
      );
    });
  });

  group('canStart', () {
    test('should return true', () {
      expect(
        const StopwatchState(stopwatchStatus: StopwatchStatus.stop).canStart,
        true,
      );
    });

    test('should return false', () {
      expect(
        const StopwatchState(stopwatchStatus: StopwatchStatus.play).canStart,
        false,
      );
    });
  });
}
