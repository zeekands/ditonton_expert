import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui/theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('Color constants are defined as expected', () {
    expect(kRichBlack, const Color(0xFF000814));
    expect(kOxfordBlue, const Color(0xFF001D3D));
    expect(kPrussianBlue, const Color(0xFF003566));
    expect(kMikadoYellow, const Color(0xFFffc300));
    expect(kDavysGrey, const Color(0xFF4B5358));
  });

  test('Text styles have expected sizes/weights', () {
    expect(kHeading5.fontSize, 23);
    expect(kHeading6.fontSize, 19);
    expect(kSubtitle.fontSize, 15);
    expect(kBodyText.fontSize, 13);
  });

  test('Text theme maps styles correctly', () {
    expect(kTextTheme.headlineMedium, kHeading5);
    expect(kTextTheme.headlineSmall, kHeading6);
    expect(kTextTheme.labelMedium, kSubtitle);
    expect(kTextTheme.bodyMedium, kBodyText);
  });

  test('ColorScheme has dark brightness and expected on colors', () {
    expect(kColorScheme.brightness, Brightness.dark);
    expect(kColorScheme.onPrimary, kRichBlack);
    expect(kColorScheme.onSecondary, Colors.white);
    expect(kColorScheme.onSurface, Colors.white);
  });

  test('DrawerTheme background color', () {
    expect(kDrawerTheme.backgroundColor, Colors.grey.shade700);
  });
}
