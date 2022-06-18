/// [String] extensions.
///
extension StringX on String {
  int? get intValue => int.tryParse(this);
  double? get doubleValue => double.tryParse(this);
  bool get isTrue => isNotEmpty && toLowerCase() == 'true';
}
