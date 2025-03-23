import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';

class MyTooltip extends StatelessWidget {
  final Widget child;
  final String message;

  const MyTooltip({super.key,
    required this.child,
    this.message = "", // '' is disable tooltip
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      showDuration: const Duration(seconds: 3),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: MyArtist.background,
        boxShadow: [MyArtist.shadow.cardShadow()],
      ),
      textStyle: MyStyle.text.captionRegular10.copyWith(color: MyArtist.onSurface),
      triggerMode: TooltipTriggerMode.tap,
      message: message,
      child: child,
    );
  }
}
