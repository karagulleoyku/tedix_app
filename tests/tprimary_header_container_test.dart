import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tedix/common/widget/containers/circular_container.dart';
import 'package:tedix/common/widget/containers/tprimary_header_container.dart';
import 'package:tedix/common/widget/curved_edges/curved_edges_widget.dart';
import 'package:tedix/utils/constants/colors.dart';

void main() {
  group('TPrimaryHeaderContainer Widget Tests', () {
    testWidgets('Renders TPrimaryHeaderContainer inside TCurvedEdgeWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TPrimaryHeaderContainer(
            child: const Text('Test Child'),
          ),
        ),
      );

      // Check if TCurvedEdgeWidget is present
      expect(find.byType(TCurvedEdgeWidget), findsOneWidget);
    });

    testWidgets('Renders two TCircularContainer widgets with correct positions', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TPrimaryHeaderContainer(
            child: const Text('Test Child'),
          ),
        ),
      );

      // Check for TCircularContainer widgets
      final circularContainers = find.byType(TCircularContainer);
      expect(circularContainers, findsNWidgets(2));

      // Check positions of the TCircularContainer widgets
      final firstPositioned = tester.widget<Positioned>(
        find.ancestor(of: find.byWidgetPredicate((widget) => widget is TCircularContainer), matching: find.byType(Positioned)).first,
      );
      expect(firstPositioned.top, equals(-150));
      expect(firstPositioned.right, equals(-250));

      final secondPositioned = tester.widget<Positioned>(
        find.ancestor(of: find.byWidgetPredicate((widget) => widget is TCircularContainer), matching: find.byType(Positioned)).last,
      );
      expect(secondPositioned.top, equals(100));
      expect(secondPositioned.right, equals(-300));
    });

    testWidgets('Child widget is rendered correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TPrimaryHeaderContainer(
            child: const Text('Test Child'),
          ),
        ),
      );

      // Check if child widget is rendered
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('Background color is TColors.primary', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TPrimaryHeaderContainer(
            child: const Text('Test Child'),
          ),
        ),
      );

      // Check for background color
      final containerFinder = find.descendant(of: find.byType(Container), matching: find.byType(Container)).first;
      final containerWidget = tester.widget<Container>(containerFinder);

      expect((containerWidget.decoration as BoxDecoration?)?.color, equals(TColors.primary));
    });
  });
}
