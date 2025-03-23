// ignore_for_file: avoid_dynamic_calls

import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Function? onTap;
  final Widget icon;
  final double size ;
  final double borderRadius;
  final double padding ;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  const MyIconButton({super.key,
    this.onTap,
    required this.icon,
    this.size= 48.0,
    this.padding= 11,
    this.color,
    this.boxShadow,
    this.borderRadius  =  8,
    this.gradient,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyGestureContainer(
        onTap: (){
          onTap?.call();
        },
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color ?? MyArtist.surface,
            gradient: gradient,
            boxShadow: boxShadow,
        ),
        width: size,
        height: size,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: MyAnimatedSwitcher(child: icon),
        ),
      ),
    );
  }
}
