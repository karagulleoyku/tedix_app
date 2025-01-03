import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tedix/common/widget/products/cart/t_cart_item.dart';
import 'package:tedix/utils/constants/colors.dart';
import 'package:tedix/utils/constants/image_string.dart';
import 'package:tedix/utils/constants/sizes.dart';
import 'package:tedix/common/widget/images/t_rounded_image.dart';
import 'package:tedix/common/widget/texts/brand_title_text.dart';
import 'package:tedix/common/widget/texts/product_title_text.dart';

void main() {
  group('TCartItem Widget Tests', () {
    testWidgets('Renders TRoundedImage with correct properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TCartItem(),
          ),
        ),
      );

      // Check if TRoundedImage is present
      final roundedImageFinder = find.byType(TRoundedImage);
      expect(roundedImageFinder, findsOneWidget);

      // Verify properties of TRoundedImage
      final roundedImageWidget = tester.widget<TRoundedImage>(roundedImageFinder);
      expect(roundedImageWidget.imageUrl, equals(TImages.productImage1));
      expect(roundedImageWidget.width, equals(60));
      expect(roundedImageWidget.height, equals(60));
      expect(roundedImageWidget.padding, equals(const EdgeInsets.all(TSizes.sm)));
      expect(roundedImageWidget.backgroundColor, equals(TColors.light));
    });

    testWidgets('Renders TProductTitleText with correct title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TCartItem(),
          ),
        ),
      );

      // Check if TProductTitleText is present with correct title
      final productTitleFinder = find.byType(TProductTitleText);
      expect(productTitleFinder, findsOneWidget);

      final productTitleWidget = tester.widget<TProductTitleText>(productTitleFinder);
      expect(productTitleWidget.title, equals('Iphone 16 Pro Max'));
    });

    testWidgets('Renders TBrandTitleText with correct title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TCartItem(),
          ),
        ),
      );

      // Check if TBrandTitleText is present with correct title
      final brandTitleFinder = find.byType(TBrandTitleText);
      expect(brandTitleFinder, findsOneWidget);

      final brandTitleWidget = tester.widget<TBrandTitleText>(brandTitleFinder);
      expect(brandTitleWidget.title, equals('Apple'));
    });

    testWidgets('Ensures Row widget contains all elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TCartItem(),
          ),
        ),
      );

      // Check for Row widget
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);

      // Verify the Row contains TRoundedImage and Column
      final rowWidget = tester.widget<Row>(rowFinder);
      expect(rowWidget.children.length, 2);

      // Verify the first child is TRoundedImage
      expect(rowWidget.children.first, isA<TRoundedImage>());

      // Verify the second child is a Column
      expect(rowWidget.children.last, isA<Column>());
    });
  });
}
