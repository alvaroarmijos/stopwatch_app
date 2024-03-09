import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/vo/lap.dart';

void main() {
  const lap = Lap.empty;

  group('Entity', () {
    test('should be a subclass of Lap entity', () {
      expect(lap, isA<Lap>());
    });

    test('should be a Commit empty', () {
      const lapEmpty = Lap(
        duration: Duration(),
        index: 0,
      );
      expect(lap, lapEmpty);
    });
  });
}
