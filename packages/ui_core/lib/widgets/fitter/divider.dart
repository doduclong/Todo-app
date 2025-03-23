import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';

class MyDivider extends StatelessWidget{

  /// Translate:  Thụt vào
  final double? indent;
  final bool isVertical;
  final Color? color;
  final double? heightOrWidth;
  final double? thickness;


  const MyDivider({
    this.indent = 0,
    this.isVertical = false,
    this.color,
    this.heightOrWidth,
    this.thickness,});

  @override
  Widget build(BuildContext context) {
   return
   MyVisibility(
     visible: isVertical,
     replacement: Divider(
       indent: indent,
       endIndent: indent,
       height: heightOrWidth,
       thickness: thickness ?? 1,
       color: color ?? MyArtist.onSurface3,
     ),
     child: VerticalDivider(
       indent: indent,
       endIndent: indent,
       width: heightOrWidth,
       thickness: thickness ?? 0.5,
       color: color ?? MyArtist.onSurface2,
     ),
   );
  }
}
