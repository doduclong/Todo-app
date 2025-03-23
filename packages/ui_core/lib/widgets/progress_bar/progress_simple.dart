// ignore_for_file: depend_on_referenced_packages

import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyProgressSimple extends StatelessWidget {
  final bool isShowProgress;
  final String? detail;
  final TextStyle? style;
  final Color? color;
  final String? tag; // For Hero
  final Widget? icon;

  const MyProgressSimple({
    super.key,
    this.isShowProgress = false,
    this.detail,
    this.style,
    this.tag,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MyHero(
      tag: tag,
      child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isShowProgress)
          MyProgressCircular(
            size: 14,
            color: color,
            strokeWidth: 1.2,
          ),
        if (!isShowProgress && icon != null)
          SizedBox(
            height: 14,
            width: 14,
            child: icon,
          ),
        if (isShowProgress || icon != null) const Gap(10),
        if (detail != null) Flexible(
          child: Text(
            detail ?? "",
            style: style ??
                MyStyle.text.smallTextRegular12
                    .copyWith(color: MyArtist.onSurface),
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    ),);
  }
}
