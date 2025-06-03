// lib/src/utils/plate_formatter.dart
import 'package:flutter/services.dart';

/// A [TextInputFormatter] that formats a car plate string based on a pattern.
/// 'd' for digit, 'A' for uppercase letter, ' ' for literal space.
class PlateInputFormatter extends TextInputFormatter {
  final String formatPattern;

  PlateInputFormatter(this.formatPattern);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove all non-alphanumeric characters for processing
    final String newText =
        newValue.text.replaceAll(RegExp(r'[^0-9A-Z]'), '').toUpperCase();
    final StringBuffer formatted = StringBuffer();
    int newTextIndex = 0;

    for (int i = 0; i < formatPattern.length; i++) {
      if (newTextIndex >= newText.length) {
        break; // No more input characters
      }

      final charInPattern = formatPattern[i];
      final charInNewText = newText[newTextIndex];

      if (charInPattern == ' ') {
        formatted.write(' ');
        continue;
      }

      if (charInPattern == 'd') {
        if (RegExp(r'\d').hasMatch(charInNewText)) {
          formatted.write(charInNewText);
          newTextIndex++;
        } else {
          // If the character doesn't match, stop or remove it
          return oldValue; // Revert to old value if invalid character
        }
      } else if (charInPattern == 'A') {
        if (RegExp(r'[A-Z]').hasMatch(charInNewText)) {
          formatted.write(charInNewText);
          newTextIndex++;
        } else {
          return oldValue; // Revert to old value if invalid character
        }
      } else {
        // Literal characters from pattern (e.g., 'T', 'M', 'D', 'CMD', 'IIV', etc.)
        // This is a bit tricky: we assume the user will type these literals or
        // we prepend them. For now, we'll try to match them.
        // A more advanced formatter might predict or insert these.
        if (charInPattern == charInNewText) {
          formatted.write(charInNewText);
          newTextIndex++;
        } else {
          // If a literal character in the pattern doesn't match the input
          // e.g., pattern is "D ddddd" but user types "1"
          // We might need to handle this more gracefully, perhaps by
          // allowing insertion at the beginning or guiding the user.
          // For simplicity, we'll just insert the literal if the input is short,
          // or block if it's already too long and doesn't match.
          // This part might need further refinement based on desired UX.
          if (newTextIndex < i) {
            // If user hasn't typed enough to reach this literal
            formatted.write(charInPattern);
            // Don't increment newTextIndex, as we just inserted a literal from pattern
          } else if (charInNewText == charInPattern) {
            formatted.write(charInPattern);
            newTextIndex++;
          } else {
            return oldValue; // Invalid character at this position
          }
        }
      }
    }

    // Adjust selection to the end of the formatted text
    return TextEditingValue(
      text: formatted.toString(),
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
