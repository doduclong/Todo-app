import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';

class $MyGradient {
  const $MyGradient();

  Gradient blueLinear({double opacity = 1.0}) => LinearGradient(
        begin: Alignment.bottomRight,
        end:  const Alignment(-1.479, -1.615),
        colors: [
          MyColor.blueLinear1.withOpacity(opacity),
          MyColor.blueLinear2.withOpacity(opacity),
        ],
        stops:  const <double>[0, 1],
      );

  Gradient purpleLinear({double opacity = 1.0}) => LinearGradient(
        begin: Alignment.bottomRight,
        end:  const Alignment(-1.479, -1.615),
        colors: [
          MyColor.purpleLinear1.withOpacity(opacity),
          MyColor.purpleLinear2.withOpacity(opacity),
        ],
        stops:  const <double>[0, 1],
      );

  Gradient progressBarLinear({double opacity = 1.0}) => LinearGradient(
        begin:  const Alignment(2.302, 0),
        end:  const Alignment(-0.762, 0),
        colors: [
          MyColor.purpleLinear1.withOpacity(opacity),
          MyColor.blueLinear1.withOpacity(opacity),
        ],
        stops:  const <double>[0, 1],
      );

  /// For gradient text
  Paint foregroundGradient({Gradient? gradient}) => Paint()..shader = (gradient ?? MyArtist.gradient.blueLinear()).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Widget gradientWidget(Widget widget, {
    double opacity = 1.0,
    Gradient? linearGradient,
  }) {
    if (linearGradient == null) return widget;
    return ShaderMask(
      shaderCallback: (bounds) {
        return linearGradient.createShader(bounds);
      },
      child: widget,
    );
  }

  Widget blueLinearIconSVG(SvgGenImage svgGenImage, {
    double opacity = 1.0,
    double? width,
    double? height,
  })
  => gradientWidget(
    opacity: opacity,
    svgGenImage.svg(
      colorFilter: MyArtist.colorFilter.srcIn(),
      width: width,
      height: height,
    ),
    linearGradient: blueLinear(),
  );



  Widget purpleLinearIconSVG(SvgGenImage svgGenImage, {
    double opacity = 1.0,
    double? width,
    double? height,
  })
  => gradientWidget(
    opacity: opacity,
    svgGenImage.svg(
      colorFilter: MyArtist.colorFilter.srcIn(),
      width: width,
      height: height,
    ),
    linearGradient: purpleLinear(),
  );

}
