import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:car_license_plate/car_license_plate.dart';

void main() {
  testWidgets('CarLicensePlate widget test', (WidgetTester tester) async {
    // Verify that the CarLicensePlate widget is rendered correctly.
    expect(find.byType(CarLicensePlate), findsOneWidget);
    expect(find.text('- -'),
        findsNWidgets(2)); // Adjust this based on your widget structure
    expect(find.text('الف'), findsOneWidget); // Default dropdown value

    // You can add more test cases based on your requirements.
  });

  testWidgets('VehiclePlateInfoWidget widget test',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VehiclePlateInfoWidget(
            cityNumberSection: '1234', // Customize widget properties as needed
            twoNumberSection: '56',
            threeNumberSection: '789',
            alphabetSection: 'ب',
          ),
        ),
      ),
    );

    // Verify that the VehiclePlateInfoWidget widget is rendered correctly.
    expect(find.byType(VehiclePlateInfoWidget), findsOneWidget);
    expect(find.text('1234'), findsOneWidget);
    expect(find.text('789'), findsOneWidget);
    expect(find.text('ب'), findsOneWidget);
    expect(find.text('56'), findsOneWidget);

    // You can add more test cases based on your requirements.
  });
}
