import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';

class MyProgressCircular extends StatefulWidget {

  final double size;
  final double strokeWidth;
  final Color? color;

  const MyProgressCircular({
    super.key,
    this.size = 60,
    this.strokeWidth = 2.0,
    this.color,});



  @override
  State<StatefulWidget> createState() => _MyProgressCircular();
}

class _MyProgressCircular extends State<MyProgressCircular>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  final colorTween = TweenSequence([
    TweenSequenceItem(
      tween: ColorTween(begin: MyColor.blueLinear1, end: MyColor.blueLinear2),
      weight: 1,
    ),
    TweenSequenceItem(
      tween:
          ColorTween(begin: MyColor.blueLinear2, end: MyColor.purpleLinear1),
      weight: 1,
    ),
    TweenSequenceItem(
      tween: ColorTween(
          begin: MyColor.purpleLinear1, end: MyColor.purpleLinear2,),
      weight: 1,
    ),
    TweenSequenceItem(
      tween:
          ColorTween(begin: MyColor.purpleLinear2, end: MyColor.blueLinear1),
      weight: 1,
    ),
  ]);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
    _colorAnimation = _controller.drive(colorTween);
  }

  @override
  void dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => SizedBox(
        width: widget.size,
        height: widget.size,
        child: CircularProgressIndicator(
          strokeWidth: widget.strokeWidth,
          color: widget.color ?? _colorAnimation.value?.withOpacity(0.8),
          backgroundColor: MyArtist.noColor,
        ),
      ),
    );
  }
}
