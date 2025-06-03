// lib/src/widgets/avto_raqam_input.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/uz_plate_format.dart';
import '../utils/uz_plate_data.dart';
import '../utils/plate_formatter.dart';

/// A Flutter widget for entering and validating Uzbek car plate numbers.
class AvtoRaqamInput extends StatefulWidget {
  /// Callback fired when the input changes. Provides the raw (unformatted) plate number.
  final ValueChanged<String>? onChanged;

  /// Callback fired when the input is validated as a valid Uzbek plate.
  final ValueChanged<String>? onValid;

  /// Callback fired when the input is invalid.
  final ValueChanged<String>? onInvalid;

  /// Initial value for the input field.
  final String? initialValue;

  /// Decoration for the input field.
  final InputDecoration? decoration;

  const AvtoRaqamInput({
    super.key,
    this.onChanged,
    this.onValid,
    this.onInvalid,
    this.initialValue,
    this.decoration,
  });

  @override
  State<AvtoRaqamInput> createState() => _AvtoRaqamInputState();
}

class _AvtoRaqamInputState extends State<AvtoRaqamInput> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;
  UzPlateFormat?
      _currentHintFormat; // The format currently used for hint/masking

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
      _validate(_controller.text); // Validate initial value
    }
    _updateHintFormat(''); // Initialize hint
    _controller.addListener(_onControllerChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChange);
    _controller.dispose();
    super.dispose();
  }

  void _onControllerChange() {
    // This listener helps in dynamically adjusting the formatter or hint
    // as the user types.
    String text =
        _controller.text.replaceAll(' ', ''); // Remove spaces for raw check
    _updateHintFormat(text);
  }

  void _updateHintFormat(String rawInput) {
    // Try to find the best matching format for the current input.
    // This is a simple heuristic: pick the first format whose pattern starts with the raw input.
    // Or, if no match, default to the most common (e.g., 'Oddiy (Yangi)').
    UzPlateFormat? bestMatch;
    for (var format in uzbekPlateFormats) {
      // Remove spaces from displayExample to match raw input for comparison
      String exampleWithoutSpaces = format.displayExample.replaceAll(' ', '');
      if (exampleWithoutSpaces
          .toLowerCase()
          .startsWith(rawInput.toLowerCase())) {
        bestMatch = format;
        break;
      }
    }

    if (bestMatch == null && rawInput.isEmpty) {
      // If no input, default to the most common format for hint
      bestMatch = uzbekPlateFormats.firstWhere(
        (f) => f.label == "Oddiy (Yangi, 2008-yildan)",
        orElse: () => uzbekPlateFormats[0], // Fallback to first if not found
      );
    }

    if (_currentHintFormat?.label != bestMatch?.label) {
      setState(() {
        _currentHintFormat = bestMatch;
      });
    }
  }

  void _validate(String formattedValue) {
    // Remove spaces before validation against regexes
    final String rawValue = formattedValue.replaceAll(' ', '');
    UzPlateFormat? matchedFormat;

    for (var format in uzbekPlateFormats) {
      if (format.regex.hasMatch(rawValue)) {
        matchedFormat = format;
        break;
      }
    }

    setState(() {
      _errorText = matchedFormat == null ? "Noto'g'ri raqam formati" : null;
    });

    widget.onChanged?.call(rawValue); // Always return raw value
    if (matchedFormat != null) {
      widget.onValid?.call(rawValue);
    } else {
      widget.onInvalid?.call(rawValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dynamically choose the formatter based on the best-matched format.
    // If no format is matched yet, use a default formatter or no formatter.
    final List<TextInputFormatter> formatters = [];
    if (_currentHintFormat != null) {
      formatters.add(PlateInputFormatter(_currentHintFormat!.pattern));
    } else {
      // Fallback formatter if no specific format is detected yet
      formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[0-9A-Z ]')));
    }

    return TextField(
      controller: _controller,
      inputFormatters: formatters,
      keyboardType: TextInputType
          .text, // Could be number for pure number parts, but text is safer
      textCapitalization: TextCapitalization.characters,
      decoration: widget.decoration?.copyWith(
            hintText: _currentHintFormat?.displayExample ?? "Avtomobil raqami",
            labelText: "Avtomobil raqami",
            errorText: _errorText,
            border: const OutlineInputBorder(),
          ) ??
          InputDecoration(
            hintText: _currentHintFormat?.displayExample ?? "Avtomobil raqami",
            labelText: "Avtomobil raqami",
            errorText: _errorText,
            border: const OutlineInputBorder(),
          ),
      onChanged: _validate,
    );
  }
}
