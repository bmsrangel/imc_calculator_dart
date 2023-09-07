import 'dart:convert';
import 'dart:io';

import 'src/exceptions/invalid_height_exception.dart';
import 'src/exceptions/invalid_weight_exception.dart';
import 'src/models/person_model.dart';
import 'src/services/imc_calculator_service.dart';

void execute() {
  print('Por favor, informe seu nome: ');
  String? name = stdin.readLineSync(encoding: utf8);
  while (name == null || name.isEmpty) {
    print('Nome inválido! Por favor, informe seu nome: ');
    name = stdin.readLineSync(encoding: utf8);
  }

  print('Por favor, informe seu peso: ');
  String? weight = stdin.readLineSync(encoding: utf8);
  while (weight == null || double.tryParse(weight) == null) {
    print('Peso inválido! Por favor, informe seu peso: ');
    weight = stdin.readLineSync(encoding: utf8);
  }

  print('Por favor, informe sua altura: ');
  String? height = stdin.readLineSync(encoding: utf8);
  while (height == null || double.tryParse(height) == null) {
    print('Altura inválida! Por favor, informe sua altura: ');
    height = stdin.readLineSync(encoding: utf8);
  }

  final numericWeight = double.tryParse(weight);
  final numericHeight = double.tryParse(height);

  final user =
      PersonModel(name: name, weight: numericWeight!, height: numericHeight!);
  final imcCalculatorService = IMCCalculatorService();

  try {
    final imc = imcCalculatorService.calculateIMC(user);
    final classification = imcCalculatorService.getIMCClassification(imc);
    print(
        'O usuário ${user.name} tem IMC de $imc e sua classificação é ${classification.description}');
  } on InvalidHeightException catch (e) {
    print(e.message);
  } on InvalidWeightException catch (e) {
    print(e.message);
  } finally {
    exit(0);
  }
}
