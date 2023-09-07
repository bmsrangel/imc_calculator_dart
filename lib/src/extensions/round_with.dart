import 'dart:math';

extension RoundWith on double {
  double roundWith([int? digits]) {
    if (digits == null) {
      return roundToDouble();
    } else {
      final roundFactor = pow(10, digits);
      return (this * roundFactor).round() / roundFactor;
    }
  }
}
