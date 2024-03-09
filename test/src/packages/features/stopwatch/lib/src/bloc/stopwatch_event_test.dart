import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/bloc/stopwatch_bloc.dart';

void main() {
  const int mockSeconds = 0;
  test('StartTimerEvent supports value comparisions',
      () => expect(const StartTimerEvent(), const StartTimerEvent()));

  test('AddTimeEvent supports value comparisions',
      () => expect(const AddTimeEvent(), const AddTimeEvent()));

  test('StopTimerEvent supports value comparisions',
      () => expect(const StopTimerEvent(), const StopTimerEvent()));

  test('ResetTimerEvent supports value comparisions',
      () => expect(const ResetTimerEvent(), const ResetTimerEvent()));

  test(
      'AddLapEvent supports value comparisions',
      () => expect(
          const AddLapEvent(mockSeconds), const AddLapEvent(mockSeconds)));
}
