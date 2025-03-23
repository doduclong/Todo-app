import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatelessWidget {

  final int duration;
  final Widget? child;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final bool isEnable;
  final Color? color;
  final Function()? onEnd;
  final BoxConstraints? constraints;
  final Clip clipBehavior;

  const MyAnimatedContainer({super.key,
    this.duration = 100,
    this.child,
    this.alignment,
    this.margin,
    this.padding,
    this.decoration,
    this.width,
    this.height,
    this.isEnable = true,
    this.color, this.onEnd,
    this.constraints,
    this.clipBehavior = Clip.none,});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      clipBehavior: clipBehavior,
      constraints: constraints,
      onEnd: (){
        onEnd?.call();
      },
      color: decoration != null ? null : color,
      alignment: alignment,
      margin: margin,
      width: width,
      height: height,
      padding: padding,
      decoration: decoration,
      duration: Duration(milliseconds: isEnable ? duration : 0),
      child: child,
    );
  }
}
