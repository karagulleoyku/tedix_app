import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tedix/features/shop/screens/cart/cart.dart';
import 'package:tedix/navigation_menu.dart';
import 'package:tedix/features/shop/screens/succes_screen/succes_screen.dart';
import '../../../../common/widget/products/cart/cart_items.dart';

void main() {
  group('CartScreen Widget Tests', () {
    testWidgets('Displays AppBar with title "Cart"', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const CartScreen(),
        ),
      );

      // Check for AppBar and its title
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Cart'), findsOneWidget);
    });

    testWidgets('Displays TCartItems widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const CartScreen(),
        ),
      );

      // Check for TCartItems widget
      expect(find.byType(TCartItems), findsOneWidget);
    });

    testWidgets('Displays bottom navigation bar with Request button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const CartScreen(),
        ),
      );

      // Check for ElevatedButton in bottomNavigationBar
      final requestButtonFinder = find.widgetWithText(ElevatedButton, 'Request');
      expect(requestButtonFinder, findsOneWidget);
    });

    testWidgets('Navigates to SuccessScreen on Request button press', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const CartScreen(),
        ),
      );

      // Tap the Request button
      final requestButtonFinder = find.widgetWithText(ElevatedButton, 'Request');
      await tester.tap(requestButtonFinder);
      await tester.pumpAndSettle();

      // Verify SuccessScreen is displayed
      expect(find.byType(SuccessScreen), findsOneWidget);
      expect(find.text('Your Request Has Been Received'), findsOneWidget);
    });

    testWidgets('Navigates to NavigationMenu from SuccessScreen', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const CartScreen(),
        ),
      );

      // Tap the Request button
      final requestButtonFinder = find.widgetWithText(ElevatedButton, 'Request');
      await tester.tap(requestButtonFinder);
      await tester.pumpAndSettle();

      // Tap the button in SuccessScreen
      final successScreenButtonFinder = find.widgetWithText(ElevatedButton, 'Go to Menu');
      await tester.tap(successScreenButtonFinder);
      await tester.pumpAndSettle();

      // Verify NavigationMenu is displayed
      expect(find.byType(NavigationMenu), findsOneWidget);
    });
  });
}
