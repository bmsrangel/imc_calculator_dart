import 'package:imc_calculator_dart/src/enums/imc_classification_enum.dart';
import 'package:imc_calculator_dart/src/exceptions/invalid_height_exception.dart';
import 'package:imc_calculator_dart/src/exceptions/invalid_weight_exception.dart';
import 'package:imc_calculator_dart/src/models/person_model.dart';
import 'package:imc_calculator_dart/src/services/imc_calculator_service.dart';
import 'package:test/test.dart';

void main() {
  late IMCCalculatorService service;

  setUpAll(() {
    service = IMCCalculatorService();
  });

  group('IMC calculation tests', () {
    test('calculation should be 29.06 when height is 1.9 and weight is 104.9',
        () {
      final person = PersonModel(name: 'John', weight: 104.9, height: 1.9);
      final imc = service.calculateIMC(person);
      expect(imc, 29.06);
    });

    test('Should throw an exception if weight is less than or equal to 0', () {
      var person = PersonModel(name: 'John', weight: 0, height: 1.9);
      expect(
        () => service.calculateIMC(person),
        throwsA(
          isA<InvalidWeightException>(),
        ),
      );
      person = PersonModel(name: 'John', weight: -1, height: 1.9);
      expect(
        () => service.calculateIMC(person),
        throwsA(
          isA<InvalidWeightException>(),
        ),
      );
    });

    test('Should throw an exception if height is less than or equal to 0', () {
      var person = PersonModel(name: 'John', weight: 104.9, height: 0);
      expect(
        () => service.calculateIMC(person),
        throwsA(
          isA<InvalidHeightException>(),
        ),
      );
      person = PersonModel(name: 'John', weight: 104.9, height: -1);
      expect(
        () => service.calculateIMC(person),
        throwsA(
          isA<InvalidHeightException>(),
        ),
      );
    });
  });

  group('IMC classification tests', () {
    test('Should return IMCClassificationEnum.severeThinness when IMC is 15',
        () {
      final result = service.getIMCClassification(15);
      expect(result, equals(IMCClassificationEnum.severeThinness));
    });
    test(
        'Should return IMCClassificationEnum.moderateThinness when IMC is 16 and less than 17',
        () {
      var result = service.getIMCClassification(16);
      expect(result, equals(IMCClassificationEnum.moderateThinness));
      result = service.getIMCClassification(16.9);
      expect(result, equals(IMCClassificationEnum.moderateThinness));
    });
    test(
        'Should return IMCClassificationEnum.mildThinness when IMC is 17 and less than 18.5',
        () {
      var result = service.getIMCClassification(17);
      expect(result, equals(IMCClassificationEnum.mildThinness));
      result = service.getIMCClassification(18.49);
      expect(result, equals(IMCClassificationEnum.mildThinness));
    });
    test(
        'Should return IMCClassificationEnum.normal when IMC is 18.5 and less than 25',
        () {
      var result = service.getIMCClassification(18.5);
      expect(result, equals(IMCClassificationEnum.normal));
      result = service.getIMCClassification(24.9);
      expect(result, equals(IMCClassificationEnum.normal));
    });
    test(
        'Should return IMCClassificationEnum.overweight when IMC is 25 and less than 30',
        () {
      var result = service.getIMCClassification(25);
      expect(result, equals(IMCClassificationEnum.overweight));
      result = service.getIMCClassification(29.9);
      expect(result, equals(IMCClassificationEnum.overweight));
    });
    test(
        'Should return IMCClassificationEnum.obesityI when IMC is 30 and less than 35',
        () {
      var result = service.getIMCClassification(30);
      expect(result, equals(IMCClassificationEnum.obesityI));
      result = service.getIMCClassification(34.9);
      expect(result, equals(IMCClassificationEnum.obesityI));
    });
    test(
        'Should return IMCClassificationEnum.obesityII when IMC is 35 and less than 40',
        () {
      var result = service.getIMCClassification(35);
      expect(result, equals(IMCClassificationEnum.obesityII));
      result = service.getIMCClassification(39.9);
      expect(result, equals(IMCClassificationEnum.obesityII));
    });
    test(
        'Should return IMCClassificationEnum.obesityIII when IMC is greater than or equal to 40',
        () {
      var result = service.getIMCClassification(40);
      expect(result, equals(IMCClassificationEnum.obesityIII));
      result = service.getIMCClassification(41);
      expect(result, equals(IMCClassificationEnum.obesityIII));
    });
  });
}
