import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tedix/common/widget/curved_edges/curved_edges.dart';
import 'package:tedix/common/widget/curved_edges/tcurved_edge_widget.dart';

void main() {
  group('TCurvedEdgeWidget Widget Tests', () {
    testWidgets('Renders ClipPath with TCustomCurvedEdges clipper', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TCurvedEdgeWidget(
            child: Text('Test Child'),
          ),
        ),
      );

      // Check if ClipPath is present
      final clipPathFinder = find.byType(ClipPath);
      expect(clipPathFinder, findsOneWidget);

      // Verify that TCustomCurvedEdges is used as the clipper
      final clipPathWidget = tester.widget<ClipPath>(clipPathFinder);
      expect(clipPathWidget.clipper, isA<TCustomCurvedEdges>());
    });

    testWidgets('Renders child widget inside TCurvedEdgeWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TCurvedEdgeWidget(
            child: Text('Test Child'),
          ),
        ),
      );

      // Check if the child widget is rendered
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('Does not throw error when child is null', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TCurvedEdgeWidget(),
        ),
      );

      // Check if the widget renders without a child
      final clipPathFinder = find.byType(ClipPath);
      expect(clipPathFinder, findsOneWidget);
    });
  });
}
