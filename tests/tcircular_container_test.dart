import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tedix/common/widget/containers/tcircular_container.dart';

void main() {
  group('TCircularContainer Widget Tests', () {
    testWidgets('Renders TCircularContainer with default properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TCircularContainer(),
        ),
      );

      // Check if Container is rendered
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);

      // Check default width, height, and background color
      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(containerWidget.constraints?.maxWidth, equals(400));
      expect(containerWidget.constraints?.maxHeight, equals(400));
      expect(decoration.color, equals(Colors.white10));
      expect(decoration.borderRadius?.topLeft.x, equals(400));
    });

    testWidgets('Applies custom width, height, and padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TCircularContainer(
            width: 300,
            height: 300,
            padding: 16,
          ),
        ),
      );

      // Check for the updated width and height
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);

      expect(containerWidget.constraints?.maxWidth, equals(300));
      expect(containerWidget.constraints?.maxHeight, equals(300));

      // Check for padding
      final padding = containerWidget.padding as EdgeInsets;
      expect(padding.left, equals(16));
    });

    testWidgets('Renders child widget inside TCircularContainer', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TCircularContainer(
            child: Text('Test Child'),
          ),
        ),
      );

      // Check for the child widget
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('Applies custom background color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TCircularContainer(
            backgroundColor: Colors.red,
          ),
        ),
      );

      // Check for the custom background color
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, equals(Colors.red));
    });
  });
}
