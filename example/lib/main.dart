import 'package:flutter/material.dart';
import 'package:avto_raqam/avto_raqam.dart'; // Import your package

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avto Raqam Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AvtoRaqamDemoPage(),
    );
  }
}

class AvtoRaqamDemoPage extends StatefulWidget {
  const AvtoRaqamDemoPage({super.key});

  @override
  State<AvtoRaqamDemoPage> createState() => _AvtoRaqamDemoPageState();
}

class _AvtoRaqamDemoPageState extends State<AvtoRaqamDemoPage> {
  String _currentPlate = '';
  String _validationStatus = 'Kiritishni boshlang';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avto Raqam Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Oʻzbekiston avtomobil raqamlari',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            AvtoRaqamInput(
              onChanged: (plate) {
                setState(() {
                  _currentPlate = plate;
                  _validationStatus = 'Tekshirilmoqda...';
                });
                debugPrint("Raw input: $plate");
              },
              onValid: (plate) {
                setState(() {
                  _validationStatus = 'Yaroqli raqam: $plate';
                });
                debugPrint("Valid Plate: $plate");
              },
              onInvalid: (plate) {
                setState(() {
                  _validationStatus = 'Noto\'g\'ri format: $plate';
                });
                debugPrint("Invalid Plate: $plate");
              },
              // You can pass custom decoration
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.car_rental),
                suffixIcon: Icon(Icons.check_circle_outline),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Hozirgi kiritilgan raqam (raw): $_currentPlate',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Holat: $_validationStatus',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _validationStatus.startsWith('Yaroqli')
                    ? Colors.green
                    : _validationStatus.startsWith('Noto\'g\'ri')
                        ? Colors.red
                        : Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Barcha qo\'llab-quvvatlanadigan formatlar:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            ...uzbekPlateFormats
                .map((format) => Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        '${format.label}: ${format.displayExample}',
                        style: const TextStyle(fontFamily: 'monospace'),
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
