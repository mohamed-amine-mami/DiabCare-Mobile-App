// DiabCare Pharmacy App Widget Tests

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pim2/main.dart';

void main() {
  testWidgets('DiabCare Pharmacy app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DiabCarePharmacyApp());

    // Verify that the app loads successfully
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
