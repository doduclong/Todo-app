import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';

class $MyColorFilter {
  const $MyColorFilter();

  ColorFilter srcIn({Color? color})
  => ColorFilter.mode(color ?? MyColor.white, BlendMode.srcIn);

  Widget colorFilterSvg(SvgGenImage svgGenImage ,{
    Color? color,
    double? size,})
  => svgGenImage.svg(
      colorFilter: srcIn(color: color), width: size, height: size,);

  Widget colorFilterWidget(Widget child, {
    Color? color,
  }) =>
      ColorFiltered(
        colorFilter: srcIn(color: color),
        child: child,
      );
}
