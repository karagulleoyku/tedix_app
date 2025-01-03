import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tedix/common/widget/containers/tsearch_container.dart';

void main() {
  group('TSearchContainer Widget Tests', () {
    testWidgets('Renders TSearchContainer with default properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TSearchContainer(text: 'Search'),
        ),
      );

      // Check if Container is rendered
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);

      // Check for the icon and text
      expect(find.byIcon(Iconsax.search_normal), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('Applies background color when showBackground is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TSearchContainer(
            text: 'Search',
            showBackground: true,
          ),
        ),
      );

      // Check for background color
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration?;

      expect(decoration?.color, equals(const Color.fromRGBO(249, 249, 249, 100)));
    });

    testWidgets('Does not apply background color when showBackground is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TSearchContainer(
            text: 'Search',
            showBackground: false,
          ),
        ),
      );

      // Check for transparent background
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration?;

      expect(decoration?.color, equals(Colors.transparent));
    });

    testWidgets('Renders border when showBorder is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TSearchContainer(
            text: 'Search',
            showBorder: true,
          ),
        ),
      );

      // Check for border
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration?;

      expect(decoration?.border, isNotNull);
    });

    testWidgets('Does not render border when showBorder is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TSearchContainer(
            text: 'Search',
            showBorder: false,
          ),
        ),
      );

      // Check for no border
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration?;

      expect(decoration?.border, isNull);
    });

    testWidgets('Calls onTap when TSearchContainer is tapped', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: TSearchContainer(
            text: 'Search',
            onTap: () {
              tapped = true;
            },
          ),
        ),
      );

      // Simulate a tap
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      // Verify the onTap callback was triggered
      expect(tapped, isTrue);
    });
  });
}
