import 'package:flutter/material.dart';
import 'uz_plate_formats.dart';

class AvtoRaqamInput extends StatefulWidget {
  final void Function(String)? onChanged;

  const AvtoRaqamInput({super.key, this.onChanged});

  @override
  State<AvtoRaqamInput> createState() => _AvtoRaqamInputState();
}

class _AvtoRaqamInputState extends State<AvtoRaqamInput> {
  final TextEditingController _controller = TextEditingController();
  String? _error;

  void _validate(String value) {
    final isValid = uzbekPlateFormats.any(
      (format) => format.regex.hasMatch(value),
    );
    setState(() {
      _error = isValid ? null : "Noto'g'ri raqam formati";
    });
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: "01 A 123 AB",
        labelText: "Avtomobil raqami",
        errorText: _error,
        border: const OutlineInputBorder(),
      ),
      onChanged: _validate,
    );
  }
}
