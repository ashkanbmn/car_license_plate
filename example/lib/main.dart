import 'package:flutter/material.dart';
import 'package:car_license_plate/car_license_plate.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const PlateDemoPage(),
    );
  }
}

class PlateDemoPage extends StatefulWidget {
  const PlateDemoPage({super.key});

  @override
  State<PlateDemoPage> createState() => _PlateDemoPageState();
}

class _PlateDemoPageState extends State<PlateDemoPage> {
  String alphabet = 'ب';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car License Plate')),
      body: CarLicensePlate(
        cityNumber: '12',
        twoNumberSection: '345',
        threeNumberSection: '678',
        alphabetSection: 'ب',
        usePersianNumbers: true,
      ),
    );
  }
}
