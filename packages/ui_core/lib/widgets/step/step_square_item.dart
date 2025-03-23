import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';

class MyStepSquareItem extends StatelessWidget {

  /// [isCurrentStep] null is new step, true is current one, false is old one
  final bool? isCurrentStep;
  final Widget child;
  final Function()? onTap;

  const MyStepSquareItem({super.key, this.isCurrentStep, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return MyGestureContainer(
      onTap: onTap,
      isEnable: onTap != null,
      width: 67.5,
      height: 65,
      decoration: BoxDecoration(
        border: isCurrentStep == null
            ? Border.all(color: MyArtist.onSurface3.withOpacity(0.1) , width: 0.5 )
            : isCurrentStep == true
            ? Border.all(color: MyArtist.onSurface.withOpacity(0.1) , width: 1.2 )
            : null,
        color: isCurrentStep == null ? MyArtist.onSurface3.withOpacity(0.1) : MyArtist.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      child: MyVisibility(
          visible: isCurrentStep == false,
          replacement: MyArtist.colorFilter.colorFilterWidget(child, color: MyArtist.onSurface3),
          child: child,),
    );
  }
}
