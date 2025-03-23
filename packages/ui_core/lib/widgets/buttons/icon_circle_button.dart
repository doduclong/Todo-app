// ignore_for_file: avoid_dynamic_calls

import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';

class MyIconCircleButton extends StatelessWidget {
  final Function()? onTap;
  final Widget? icon;
  final double size ;
  final double padding ;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;

  const MyIconCircleButton({super.key,
    this.onTap,
    this.icon,
    this.size= 50,
    this.padding= 16,
    this.gradient, this.boxShadow,});

  @override
  Widget build(BuildContext context) {
    return MyGestureContainer(
      onTap: onTap,
      width: size,
      height: size,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        shape: BoxShape.circle,
          gradient: gradient ?? MyArtist.gradient.blueLinear(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: icon  ?? MyAssets.icons.light.next.svg(),
      ),
    );
  }
}
