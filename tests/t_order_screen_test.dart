import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tedix/features/shop/screens/order/widgets/orders_list.dart';
import 'package:tedix/features/shop/screens/order/t_order_screen.dart';

void main() {
  group('TOrderScreen Widget Tests', () {
    testWidgets('Renders TOrderScreen with AppBar and OrderListItems', (WidgetTester tester) async {
      // Pump the widget
      await tester.pumpWidget(
        MaterialApp(
          home: TOrderScreen(),
        ),
      );

      // Check if the AppBar with the title 'My Orders' is present
      expect(find.text('My Orders'), findsOneWidget);

      // Check if the back arrow is displayed
      expect(find.byType(IconButton), findsOneWidget);

      // Check if TOrderListItems widget is present
      expect(find.byType(TOrderListItems), findsOneWidget);
    });

    testWidgets('AppBar should have a back arrow', (WidgetTester tester) async {
      // Pump the widget
      await tester.pumpWidget(
        MaterialApp(
          home: TOrderScreen(),
        ),
      );

      // Verify the AppBar has a back arrow button
      final backButtonFinder = find.byType(IconButton);
      expect(backButtonFinder, findsOneWidget);
    });
  });
}
