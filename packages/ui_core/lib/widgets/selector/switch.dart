import 'package:flutter/material.dart';

import 'package:ui_core/src.dart';

class MySwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final int duration;

  const MySwitch({super.key,
    required this.value,
    required this.onChanged,
    this.duration = 250,});

  @override
  Widget build(BuildContext context) {
    return MyGestureContainer(
      duration: duration,
      onTap: () {
        value == false ? onChanged(true) : onChanged(false);
      },
      width: 44,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: value ? null : MyArtist.onSurface3,
        gradient: value ? MyArtist.gradient.purpleLinear() : null,
      ),
      child: MyAnimatedContainer(
        duration: duration,
        padding: const EdgeInsets.all(4),
        alignment:
        value
            ? ((Directionality.of(context) == TextDirection.rtl) ? Alignment.centerLeft : Alignment.centerRight)
            : ((Directionality.of(context) == TextDirection.rtl) ? Alignment.centerRight : Alignment.centerLeft ) ,
        child: const MyAnimatedContainer(
          width: 17,
          height: 17,
          decoration: BoxDecoration(
            shape: BoxShape.circle, color: MyColor.white,),
        ),
      ),
    );
  }
}