// lib/src/models/uz_plate_format.dart
class UzPlateFormat {
  final String label;
  final RegExp regex;
  final String displayExample;
  final String pattern; // Pattern to guide input, e.g., "dd A ddd AA"

  UzPlateFormat({
    required this.label,
    required this.regex,
    required this.displayExample,
    required this.pattern,
  });
}
