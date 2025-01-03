import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tedix/common/styles/spacing_styles.dart';
import 'package:tedix/utils/constants/text_strings.dart';
import 'package:tedix/features/shop/screens/succes_screen/success_screen.dart';

void main() {
  group('SuccessScreen Widget Tests', () {
    testWidgets('Renders SuccessScreen with correct title', (WidgetTester tester) async {
      const testTitle = 'Your Request Has Been Received';

      await tester.pumpWidget(
        MaterialApp(
          home: SuccessScreen(
            title: testTitle,
            onPressed: () {},
          ),
        ),
      );

      // Check if the title is rendered
      expect(find.text(testTitle), findsOneWidget);
    });

    testWidgets('Renders "Continue" button and it is clickable', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: SuccessScreen(
            title: 'Test Title',
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      );

      // Check if "Continue" button is rendered
      final continueButtonFinder = find.widgetWithText(ElevatedButton, TTexts.tContinue);
      expect(continueButtonFinder, findsOneWidget);

      // Simulate a button tap
      await tester.tap(continueButtonFinder);
      await tester.pumpAndSettle();

      // Verify the onPressed callback was triggered
      expect(wasPressed, isTrue);
    });

    testWidgets('Applies padding with TSpacingStyle', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SuccessScreen(
            title: 'Test Title',
            onPressed: () {},
          ),
        ),
      );

      // Check if padding is applied correctly
      final paddingFinder = find.byType(Padding);
      final paddingWidget = tester.widget<Padding>(paddingFinder);

      expect(paddingWidget.padding, equals(TSpacingStyle.paddingWithAppBarHeight * 2));
    });
  });
}
