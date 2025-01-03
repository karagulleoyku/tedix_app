import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tedix/common/widget/containers/trounded_container.dart';

void main() {
  group('TRoundedContainer Widget Tests', () {
    testWidgets('Renders TRoundedContainer with default properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TRoundedContainer(),
        ),
      );

      // Check if Container is rendered
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);

      // Check default properties
      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration?;

      expect(decoration?.color, equals(Colors.white));
      expect(decoration?.borderRadius?.resolve(TextDirection.ltr).topLeft.x, equals(16));
      expect(decoration?.border, isNull); // No border by default
    });

    testWidgets('Applies custom width, height, and background color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TRoundedContainer(
            width: 200,
            height: 100,
            backgroundColor: Colors.blue,
          ),
        ),
      );

      // Check for custom width, height, and background color
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);

      expect(containerWidget.constraints?.maxWidth, equals(200));
      expect(containerWidget.constraints?.maxHeight, equals(100));
      final decoration = containerWidget.decoration as BoxDecoration?;
      expect(decoration?.color, equals(Colors.blue));
    });

    testWidgets('Renders border when showBorder is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TRoundedContainer(
            showBorder: true,
            borderColor: Colors.red,
          ),
        ),
      );

      // Check for border
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration?;

      expect(decoration?.border, isNotNull);
      expect((decoration?.border as Border?)?.top.color, equals(Colors.red));
    });

    testWidgets('Applies padding and margin correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TRoundedContainer(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
          ),
        ),
      );

      // Check for padding and margin
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);

      expect(containerWidget.padding, equals(const EdgeInsets.all(10)));
      expect(containerWidget.margin, equals(const EdgeInsets.all(20)));
    });

    testWidgets('Renders child widget inside TRoundedContainer', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TRoundedContainer(
            child: Text('Test Child'),
          ),
        ),
      );

      // Check if child widget is rendered
      expect(find.text('Test Child'), findsOneWidget);
    });
  });
}
