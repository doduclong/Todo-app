// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ui_core/src.dart';
import 'package:flutter/cupertino.dart';

class MyAnimatedText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color; // Màu sẽ được hiển thị khi kết thúc animation
  final int milliseconds;
  final TextAlign textAlign;

  const MyAnimatedText(this.text, {super.key,
    required this.style,
    this.color,
    this.milliseconds = 200,
    this.textAlign = TextAlign.start, });

//   @override
//   State<StatefulWidget> createState() => _MyAnimateText();
// }
//
// class _MyAnimateText extends State<MyAnimatedText> {
  // bool isDoneAnimation = false;

  @override
  Widget build(BuildContext context) {
    final randomColor = ([true, false]..shuffle()).first;
    return MyAnimatedSwitcher(
      duration: 0,
      child:
      // isDoneAnimation
      //     // || Platform.isIOS
      //     ? Text(widget.text, style: widget.style, textAlign: widget.textAlign,)
      //     :
      AnimatedTextKit(
              // onFinished: () {
              //   setState(() {
              //     isDoneAnimation = true;
              //   });
              // },
              totalRepeatCount: 1,
              animatedTexts: [
                MyColorizeAnimatedText(
                  textAlign: textAlign,
                  speed: Duration(milliseconds: milliseconds),
                  text,
                  textStyle: style,
                  colors: [
                    color ?? MyArtist.onBackground,
                    if (randomColor) MyColor.blueLinear1 else MyColor.purpleLinear1,
                    if (randomColor) MyColor.blueLinear2 else MyColor.purpleLinear2,
                    if (randomColor) MyColor.blueLinear1 else MyColor.purpleLinear1,
                    color ?? MyArtist.onBackground,
                  ],
                ),
              ],
            ),
    );
  }
}


class MyColorizeAnimatedText extends AnimatedText {
  final Duration speed;
  final List<Color> colors;

  final TextDirection textDirection;

  MyColorizeAnimatedText(
      String text, {
        super.textAlign,
        required TextStyle super.textStyle,
        this.speed = const Duration(milliseconds: 200),
        required this.colors,
        this.textDirection = TextDirection.ltr,
      })  : assert(null != textStyle.fontSize),
        assert(colors.length > 1),
        super(
        text: text,
        duration: speed * text.characters.length,
      );

  late Animation<double> _colorShifter, _fadeIn, _fadeOut;
  late List<Color> _colors;

  @override
  void initAnimation(AnimationController controller) {
    final tuning = (300.0 * colors.length) *
        (textStyle!.fontSize! / 24.0) *
        0.75 *
        (textCharacters.length / 15.0);

    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.1, curve: Curves.easeOut),
      ),
    );

    _fadeOut = Tween<double>(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeIn),
      ),
    );

    final colorShift = colors.length * tuning;
    final colorTween = textDirection == TextDirection.ltr
        ? Tween<double>(
      begin: 0.0,
      end: colorShift,
    )
        : Tween<double>(
      begin: colorShift,
      end: 0.0,
    );
    _colorShifter = colorTween.animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );

    _colors = textDirection == TextDirection.ltr
        ? colors
        : colors.reversed.toList(growable: false);
  }

  @override
  Widget completeText(BuildContext context) {
    final linearGradient = LinearGradient(colors: _colors).createShader(
      Rect.fromLTWH(0.0, 0.0, _colorShifter.value, 0.0),
    );

    return DefaultTextStyle.merge(
      style: textStyle,
      child: Text(
        text,
        style:
        _colorShifter.value == 0 ?
         textStyle :
        TextStyle(foreground: Paint()..shader = linearGradient),
        textAlign: textAlign,
      ),
    );
  }

  @override
  Widget animatedBuilder(BuildContext context, Widget? child) {
    return Opacity(
      opacity: _fadeIn.value != 1.0 ? _fadeIn.value : _fadeOut.value,
      child: completeText(context),
    );
  }
}



