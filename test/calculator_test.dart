import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ex/main.dart';

void main() {
  testWidgets('Addition works', (WidgetTester tester) async {
    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '5');
    await tester.enterText(find.byType(TextField).at(1), '3');
    await tester.tap(find.widgetWithText(ElevatedButton, '+'));
    await tester.pump();

    expect(find.text('Result: 8.0'), findsOneWidget);

    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '5');
    await tester.enterText(find.byType(TextField).at(1), '-3');
    await tester.tap(find.widgetWithText(ElevatedButton, '+'));
    await tester.pump();

    expect(find.text('Result: 2.0'), findsOneWidget);

    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '-5');
    await tester.enterText(find.byType(TextField).at(1), '-3');
    await tester.tap(find.widgetWithText(ElevatedButton, '+'));
    await tester.pump();

    expect(find.text('Result: -8.0'), findsOneWidget);
  });

  testWidgets('Subtraction works', (WidgetTester tester) async {
    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '10');
    await tester.enterText(find.byType(TextField).at(1), '4');
    await tester.tap(find.widgetWithText(ElevatedButton, '-'));
    await tester.pump();

    expect(find.text('Result: 6.0'), findsOneWidget);

    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '-10');
    await tester.enterText(find.byType(TextField).at(1), '4');
    await tester.tap(find.widgetWithText(ElevatedButton, '-'));
    await tester.pump();

    expect(find.text('Result: -14.0'), findsOneWidget);

    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '10');
    await tester.enterText(find.byType(TextField).at(1), '-4');
    await tester.tap(find.widgetWithText(ElevatedButton, '-'));
    await tester.pump();

    expect(find.text('Result: 14.0'), findsOneWidget);

    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '-10');
    await tester.enterText(find.byType(TextField).at(1), '-4');
    await tester.tap(find.widgetWithText(ElevatedButton, '-'));
    await tester.pump();

    expect(find.text('Result: -6.0'), findsOneWidget);
  });

  testWidgets('Multiplication works', (WidgetTester tester) async {
    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '7');
    await tester.enterText(find.byType(TextField).at(1), '6');
    await tester.tap(find.widgetWithText(ElevatedButton, '*'));
    await tester.pump();

    expect(find.text('Result: 42.0'), findsOneWidget);

    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '-7');
    await tester.enterText(find.byType(TextField).at(1), '6');
    await tester.tap(find.widgetWithText(ElevatedButton, '*'));
    await tester.pump();

    expect(find.text('Result: -42.0'), findsOneWidget);

    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '-7');
    await tester.enterText(find.byType(TextField).at(1), '-6');
    await tester.tap(find.widgetWithText(ElevatedButton, '*'));
    await tester.pump();

    expect(find.text('Result: 42.0'), findsOneWidget);
  });

  testWidgets('Division works', (WidgetTester tester) async {
    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '8');
    await tester.enterText(find.byType(TextField).at(1), '2');
    await tester.tap(find.widgetWithText(ElevatedButton, '/'));
    await tester.pump();

    expect(find.text('Result: 4.0'), findsOneWidget);

    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '-8');
    await tester.enterText(find.byType(TextField).at(1), '2');
    await tester.tap(find.widgetWithText(ElevatedButton, '/'));
    await tester.pump();

    expect(find.text('Result: -4.0'), findsOneWidget);

    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '8');
    await tester.enterText(find.byType(TextField).at(1), '-2');
    await tester.tap(find.widgetWithText(ElevatedButton, '/'));
    await tester.pump();

    expect(find.text('Result: -4.0'), findsOneWidget);

    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '-8');
    await tester.enterText(find.byType(TextField).at(1), '-2');
    await tester.tap(find.widgetWithText(ElevatedButton, '/'));
    await tester.pump();

    expect(find.text('Result: 4.0'), findsOneWidget);
  });

  testWidgets('Division by zero shows error', (WidgetTester tester) async {
    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '8');
    await tester.enterText(find.byType(TextField).at(1), '0');
    await tester.tap(find.widgetWithText(ElevatedButton, '/'));
    await tester.pump();

    expect(find.text('Cannot divide by zero'), findsOneWidget);
  });

  testWidgets('Invalid input shows error', (WidgetTester tester) async {
    await tester.pumpWidget(CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), 'abc');
    await tester.enterText(find.byType(TextField).at(1), '2');
    await tester.tap(find.widgetWithText(ElevatedButton, '+'));
    await tester.pump();

    expect(find.text('Invalid input'), findsOneWidget);
  });
}