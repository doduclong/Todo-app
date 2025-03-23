// ignore_for_file: avoid_dynamic_calls

import 'package:ui_core/src.dart';
import 'package:flutter/cupertino.dart';

class MyOnlyTextButton extends StatefulWidget {
  final Function? onTap;
  final String text;
  final bool? underlined;
  final int? maxLine;

  const MyOnlyTextButton({super.key, this.onTap, this.text = "", this.underlined = false, this.maxLine});

  @override
  State<StatefulWidget> createState() => _MyOnlyTextButton();
}

class _MyOnlyTextButton extends State<MyOnlyTextButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> size;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 150));
    final curve = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    size = Tween<double>(begin: 14, end: 12).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: () {
        _controller.reverse();
      },
      onTapUp: (_) {
        _controller.reverse().then((_) {
          widget.onTap?.call();
        });
      },
      onTapDown: (_) {
        _controller.forward();
      },
      child: Text(
        maxLines: widget.maxLine,
        widget.text,
        style: widget.underlined != false
            ? MyStyle.text.smallTextRegular10.copyWith(
                color: MyArtist.onSurface2,
                decoration: widget.underlined == null ? null : TextDecoration.underline,
              )
            : MyStyle.text.mediumTextMedium12.copyWith(
                fontSize: size.value,
                foreground: MyArtist.gradient.foregroundGradient(gradient: MyArtist.gradient.purpleLinear()),
              ),
      ),
    );
  }
}
