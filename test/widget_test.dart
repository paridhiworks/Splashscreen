import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splashes/main.dart'; // Correctly import your app's main.dart

void main() {
  testWidgets('Splash screen and navigation smoke test', (WidgetTester tester) async {
    // Build the SplashScreen and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Verify SplashScreen shows the correct text and progress indicator
    expect(find.text('Welcome to Flutter Demo!'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Simulate the 3-second delay for SplashScreen
    await tester.pump(const Duration(seconds: 3));

    // Verify that MyHomePage is shown after the SplashScreen
    expect(find.text('You have pushed the button this many times:'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
  });
}
