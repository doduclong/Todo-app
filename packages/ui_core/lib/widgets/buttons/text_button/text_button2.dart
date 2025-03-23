// ignore_for_file: depend_on_referenced_packages, avoid_dynamic_calls

import 'package:ui_core/src.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class MyTextButton2 extends StatelessWidget {
  final Function? onTap;
  final Widget? icon;
  final bool iconIsLeft;
  final String? text;
  // final double padding;
  final double margin;
  final String? tag; // For Hero
  final bool isEnable;

  const MyTextButton2({
    super.key,
    this.onTap,
    this.icon,
    this.text,
    // this.padding = 18,
    this.margin = 30,
    this.iconIsLeft = true,
    this.tag,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextButton(
      color: MyArtist.background2,
      // padding: padding,
      margin: margin,
      ltr: iconIsLeft,
      isEnable: isEnable,
      tag: tag,
      text: text,
      icon: icon,
      onTap: onTap,
      boxShadow: MyArtist.isBrightnessLight ? [MyArtist.shadow.cardShadow()] : [],
      style: MyStyle.text.textLargeBold16.copyWith(
        foreground: MyArtist.gradient.foregroundGradient(),),
    );
  }
}
