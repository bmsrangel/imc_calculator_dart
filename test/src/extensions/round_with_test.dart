import 'dart:math';

import 'package:imc_calculator_dart/src/extensions/round_with.dart';
import 'package:test/test.dart';

void main() {
  test('Should return 3.14 when rounding PI with 2 digits', () {
    final result = pi.roundWith(2);
    expect(result, equals(3.14));
  });

  test('Should return 3.142 when rounding PI with 3 digits', () {
    final result = pi.roundWith(3);
    expect(result, equals(3.142));
  });

  test('Should return 3.0 when rounding PI with 0 digits', () {
    final result = pi.roundWith();
    expect(result, 3.0);
  });
}
