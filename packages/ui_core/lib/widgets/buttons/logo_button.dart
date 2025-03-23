// ignore_for_file: avoid_dynamic_calls

import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';

class MyLogoButton extends StatelessWidget {
  final Function? onTap;
  final Widget logo;
  final double size ;
  final double padding ;

  const MyLogoButton({super.key,
    this.onTap,
    required this.logo,
    this.size= 50.0,
    this.padding= 15,});

  @override
  Widget build(BuildContext context) {
    return MyGestureContainer(
      alignment: Alignment.center,
      onTap: (){
        onTap?.call();
      },
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: MyArtist.background,
        border: Border.all(
          width: 0.8,
          color: MyArtist.onSurface3,
        ),
      ),
      width: size,
      height: size,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: logo,
      ),
    );
  }
}
