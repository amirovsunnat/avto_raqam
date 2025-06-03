import 'package:flutter/material.dart';
import 'package:avto_raqam/avto_raqam.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avto Raqam Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Avto Raqam Demo')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: AvtoRaqamInput(
            onChanged: (plate) {
              debugPrint("Kiritilgan raqam: $plate");
            },
          ),
        ),
      ),
    );
  }
}
