import 'dart:math';

import '../enums/imc_classification_enum.dart';
import '../exceptions/invalid_height_exception.dart';
import '../exceptions/invalid_weight_exception.dart';
import '../extensions/round_with.dart';
import '../models/person_model.dart';

class IMCCalculatorService {
  double calculateIMC(PersonModel person) {
    if (person.height <= 0) {
      throw InvalidHeightException(message: 'An invalid height was inserted');
    }
    if (person.weight <= 0) {
      throw InvalidWeightException(message: 'An invalid weight was inserted');
    }
    final imc = person.weight / pow(person.height, 2);
    return imc.roundWith(2);
  }

  IMCClassificationEnum getIMCClassification(double imc) {
    switch (imc) {
      case < 16:
        return IMCClassificationEnum.severeThinness;
      case < 17:
        return IMCClassificationEnum.moderateThinness;
      case < 18.5:
        return IMCClassificationEnum.mildThinness;
      case < 25:
        return IMCClassificationEnum.normal;
      case < 30:
        return IMCClassificationEnum.overweight;
      case < 35:
        return IMCClassificationEnum.obesityI;
      case < 40:
        return IMCClassificationEnum.obesityII;
      default:
        return IMCClassificationEnum.obesityIII;
    }
  }
}
