enum IMCClassificationEnum {
  severeThinness('Magreza grave'),
  moderateThinness('Magreza moderada'),
  mildThinness('Magreza leve'),
  normal('Saudável'),
  overweight('Sobrepeso'),
  obesityI('Obesidade Grau I'),
  obesityII('Obesidade Grau II (severa)'),
  obesityIII('Obesidade Grau III (mórbida)');

  final String description;
  const IMCClassificationEnum(this.description);
}
