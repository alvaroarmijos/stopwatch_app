import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/widgets/widgets.dart';

void main() {
  const duration = Duration();

  testWidgets('should render the current duration', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: LapItem(
            index: 1,
            duration: duration,
          ),
        ),
      ),
    );

    expect(find.byType(ListTile), findsOne);
    expect(find.byType(LapText), findsExactly(2));
  });

  testWidgets('should render LapText', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: LapText(
            value: '1',
            label: 'Lap',
          ),
        ),
      ),
    );

    expect(find.text('1 Lap', findRichText: true), findsOne);
  });
}
