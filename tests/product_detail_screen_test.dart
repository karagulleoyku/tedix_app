import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tedix/common/widget/texts/section_heading.dart';
import 'package:tedix/features/shop/screens/product_details/widgets/product_data_detail.dart';
import 'package:tedix/features/shop/screens/product_details/widgets/product_detail_image.dart';
import 'package:tedix/features/shop/screens/product_details/product_detail_screen.dart';
import 'package:readmore/readmore.dart';

void main() {
  group('ProductDetailScreen Widget Tests', () {
    testWidgets('Renders TProductImage widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductDetailScreen(),
          ),
        ),
      );

      // Check if TProductImage is rendered
      expect(find.byType(TProductImage), findsOneWidget);
    });

    testWidgets('Renders TProductDataDetail widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductDetailScreen(),
          ),
        ),
      );

      // Check if TProductDataDetail is rendered
      expect(find.byType(TProductDataDetail), findsOneWidget);
    });

    testWidgets('Renders "ADD CART" button and it is clickable', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductDetailScreen(),
          ),
        ),
      );

      // Check if "ADD CART" button is rendered
      final addCartButtonFinder = find.widgetWithText(ElevatedButton, 'ADD CART');
      expect(addCartButtonFinder, findsOneWidget);

      // Simulate a button tap
      await tester.tap(addCartButtonFinder);
      await tester.pumpAndSettle();

      // Verify button is clickable (No exception means success)
    });

    testWidgets('Renders "Description" heading and ReadMoreText widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductDetailScreen(),
          ),
        ),
      );

      // Check if "Description" heading is rendered
      final descriptionHeadingFinder = find.widgetWithText(TSectionHeading, 'Description');
      expect(descriptionHeadingFinder, findsOneWidget);

      // Check if ReadMoreText is rendered with the correct text
      final readMoreTextFinder = find.byType(ReadMoreText);
      expect(readMoreTextFinder, findsOneWidget);

      final readMoreWidget = tester.widget<ReadMoreText>(readMoreTextFinder);
      expect(
        readMoreWidget.data,
        contains('Titanium design, latest-generation, ceramic shield front, textured matte glass back.'),
      );
    });
  });
}
