import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/src/packages/core/utils/utils.dart';

void main() {
  test('Should add a cero in the left ', () {
    final hours = twoDigits(1);
    expect('01', hours);
  });

  test('Should not add a cero in the left ', () {
    final hours = twoDigits(10);
    expect('10', hours);
  });
}
