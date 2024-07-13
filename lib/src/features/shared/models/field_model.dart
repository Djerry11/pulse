enum PulseFieldType {
  normal,
  positivePartial,
  negativePartial,
  delete,
}

class PulseField {
  final String key;
  final dynamic value;
  final bool useKeyAsItIs;
  final PulseFieldType type;

  const PulseField({
    required this.key,
    required this.value,
    this.useKeyAsItIs = false,
  }) : type = PulseFieldType.normal;

  const PulseField.positivePartial({
    required this.key,
    required this.value,
    this.useKeyAsItIs = false,
  }) : type = PulseFieldType.positivePartial;

  const PulseField.negativePartial({
    required this.key,
    required this.value,
    this.useKeyAsItIs = false,
  }) : type = PulseFieldType.negativePartial;

  const PulseField.delete({
    required this.key,
    this.useKeyAsItIs = false,
  })  : type = PulseFieldType.delete,
        value = '';
}
