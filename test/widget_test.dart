import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roll_the_dice/main.dart';

void main() {
  testWidgets('Every roll stays in 1–6 and loads the matching local image', (
    tester,
  ) async {
    await tester.pumpWidget(const DiceApp());
    await tester.pumpAndSettle();
    expect(find.text('Hodnota: 1'), findsOneWidget);
    for (var i = 0; i < 30; i++) {
      await tester.tap(find.text('Hodiť kockou'));
      await tester.pumpAndSettle();
      final image = tester.widget<Image>(find.byType(Image));
      final asset = image.image as AssetImage;
      expect(asset.assetName, matches(r'^assets/images/dice-[1-6]\.png$'));
      final value = int.parse(
        RegExp(r'dice-(\d)').firstMatch(asset.assetName)!.group(1)!,
      );
      expect(find.text('Hodnota: $value'), findsOneWidget);
      expect(tester.takeException(), isNull);
    }
  });

  testWidgets('Button remains reachable on a small screen', (tester) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const DiceApp());
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Hodiť kockou'));
    await tester.tap(find.text('Hodiť kockou'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
