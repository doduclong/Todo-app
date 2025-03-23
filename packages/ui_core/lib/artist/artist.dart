
import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';

class MyArtist  {
  MyArtist._();

  static const $MyGradient gradient = $MyGradient();
  static const $MyShadow shadow = $MyShadow();
  static const $MyColorFilter colorFilter = $MyColorFilter();

  static bool isBrightnessLight = true;

  static Future<void> changeBrightness(bool isLight) async {
    isBrightnessLight = isLight;
    await WidgetsFlutterBinding.ensureInitialized().performReassemble();
  }
  static Color get primaryColor => const Color(0xFF008FD3);
  static Color get background => isBrightnessLight ? MyColor.backgroundColor : MyColor.blackThemeDark;
  static Color get background2 => isBrightnessLight ? MyColor.white : MyColor.darkThemeDark;
  static Color get onBackground => isBrightnessLight ? MyColor.black : MyColor.whiteThemeDark;

  static Color get surface => isBrightnessLight ? MyColor.border : MyColor.darkThemeDark;
  static Color get onSurface => isBrightnessLight ? MyColor.gray1 : MyColor.gray1ThemeDark;
  static Color get onSurface2 => isBrightnessLight ? MyColor.gray2 : MyColor.gray2ThemeDark;
  static Color get onSurface3 => isBrightnessLight ? MyColor.gray3 : MyColor.gray3ThemeDark;

  static Color get onPrimary => isBrightnessLight ? MyColor.white : MyColor.whiteThemeDark2;
  static Color get danger => isBrightnessLight ? MyColor.danger : MyColor.dangerThemeDark;
  static Color get success => isBrightnessLight ? MyColor.success : MyColor.successThemeDark;

  static const noColor = Colors.transparent;

  static Color get cardShadow7 => onBackground.withOpacity(0.07);
  static Color get cardShadow10 => onBackground.withOpacity(0.1);
  static Color get blueShadow => MyColor.blueShadow.withOpacity(0.3);
  static Color get purpleShadow => MyColor.purpleLinear1.withOpacity(0.3);
  static Color get dropShadow => (isBrightnessLight ? MyColor.dropShadow : MyColor.white).withOpacity(0.25);
}
