import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/bloc/stopwatch_bloc.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/pages/stopwatch_page.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/vo/lap.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/widgets/widgets.dart';

class MockStopwatchBloc extends MockBloc<StopwatchEvent, StopwatchState>
    implements StopwatchBloc {}

void main() {
  late MockStopwatchBloc mockStopwatchBloc;

  setUp(() {
    mockStopwatchBloc = MockStopwatchBloc();
  });

  Widget stopwathPage = BlocProvider<StopwatchBloc>(
    create: (context) => mockStopwatchBloc,
    child: const MaterialApp(
      home: StopwatchPage(),
    ),
  );

  group('Home page', () {
    testWidgets('should render initial view ', (widgetTester) async {
      when(() => mockStopwatchBloc.state).thenReturn(
        const StopwatchState(),
      );

      await widgetTester.pumpWidget(stopwathPage);

      expect(find.text('00:00:00'), findsOne);
      expect(find.byType(FloatingActionButton), findsOne);
      expect(find.byType(ListView), findsOne);
      expect(find.byType(LapItem), findsNothing);
    });

    testWidgets('should render stopwatch running ', (widgetTester) async {
      when(() => mockStopwatchBloc.state).thenReturn(
        const StopwatchState(stopwatchStatus: StopwatchStatus.play),
      );

      await widgetTester.pumpWidget(stopwathPage);

      expect(find.text('00:00:00'), findsOne);
      expect(find.byType(FloatingActionButton), findsNWidgets(2));
      expect(find.byIcon(Icons.flag), findsOne);
      expect(find.byIcon(Icons.pause), findsOne);
    });

    testWidgets('should render stopwatch paused', (widgetTester) async {
      when(() => mockStopwatchBloc.state).thenReturn(
        const StopwatchState(stopwatchStatus: StopwatchStatus.stop),
      );

      await widgetTester.pumpWidget(stopwathPage);

      expect(find.text('00:00:00'), findsOne);
      expect(find.byType(FloatingActionButton), findsNWidgets(2));
      expect(find.byIcon(Icons.stop), findsOne);
      expect(find.byIcon(Icons.play_arrow), findsOne);
    });

    testWidgets('should render stopwatch with one lap', (widgetTester) async {
      when(() => mockStopwatchBloc.state).thenReturn(
        const StopwatchState(laps: [Lap(duration: Duration(), index: 1)]),
      );

      await widgetTester.pumpWidget(stopwathPage);

      expect(find.text('00:00:00'), findsOne);
      expect(find.text('00:00:00 ', findRichText: true), findsOne);
      expect(find.byType(LapItem), findsOne);
    });
  });
}
