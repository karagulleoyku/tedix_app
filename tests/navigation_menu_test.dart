import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tedix/features/personalization/screens/settings/settings.dart';
import 'package:tedix/features/shop/screens/cart/cart.dart';
import 'package:tedix/features/shop/screens/home/home.dart';
import 'package:tedix/navigation_menu.dart';

void main() {
  group('NavigationMenu Widget Tests', () {
    testWidgets('Renders NavigationMenu with NavigationBar', (WidgetTester tester) async {
      // Pump the NavigationMenu widget
      await tester.pumpWidget(
        MaterialApp(
          home: const NavigationMenu(),
        ),
      );

      // Verify that the NavigationBar is present
      expect(find.byType(NavigationBar), findsOneWidget);

      // Verify the three NavigationDestination items are displayed
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Add Product'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);

      // Verify the correct icons are displayed
      expect(find.byIcon(Iconsax.home), findsOneWidget);
      expect(find.byIcon(Iconsax.shop), findsOneWidget);
      expect(find.byIcon(Iconsax.user), findsOneWidget);
    });

    testWidgets('NavigationMenu switches screens on tab click', (WidgetTester tester) async {
      // Pump the NavigationMenu widget
      await tester.pumpWidget(
        MaterialApp(
          home: const NavigationMenu(),
        ),
      );

      // Verify initial screen is HomeScreen
      expect(find.byType(HomeScreen), findsOneWidget);

      // Tap on the "Add Product" tab
      await tester.tap(find.text('Add Product'));
      await tester.pumpAndSettle();

      // Verify screen changes to CartScreen
      expect(find.byType(CartScreen), findsOneWidget);

      // Tap on the "Profile" tab
      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      // Verify screen changes to SettingsScreen
      expect(find.byType(SettingsScreen), findsOneWidget);
    });
  });
}
