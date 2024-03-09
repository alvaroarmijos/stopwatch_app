import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/src/packages/core/ui/ui.dart';

void main() {
  testWidgets('should render intial icon', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: SWAnimatedIcon(
          status: true,
        ),
      ),
    );

    expect(find.byKey(const Key(keyIcon1)), findsOne);
  });

  testWidgets('should render end icon', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: SWAnimatedIcon(
          status: false,
        ),
      ),
    );

    expect(find.byKey(const Key(keyIcon2)), findsOne);
  });
}
