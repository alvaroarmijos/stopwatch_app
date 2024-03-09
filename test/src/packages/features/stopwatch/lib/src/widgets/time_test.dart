import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/widgets/widgets.dart';

void main() {
  const duration = Duration();

  testWidgets('should render the current duration 00:00:00',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: Time(
          duration: duration,
        ),
      ),
    );

    expect(find.text('00:00:00'), findsOne);
  });
}
