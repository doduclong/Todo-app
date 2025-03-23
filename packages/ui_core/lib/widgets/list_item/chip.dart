import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyChip extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final Function()? onTap;
  final Gradient? gradient;
  final TextStyle? style;
  final bool? isSelect;

  const MyChip({super.key, this.icon, this.title, this.onTap, this.gradient, this.style, this.isSelect});

  @override
  Widget build(BuildContext context) {
    return  MyGestureContainer(
      // height: 38,
        constraints: const BoxConstraints(minHeight: 38),
        onTap: onTap,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: isSelect == null
                    ? (gradient ?? MyArtist.gradient.blueLinear(opacity: 0.1))
                    : (isSelect! ? MyArtist.gradient.blueLinear() : null),
          color: isSelect == false ? MyArtist.surface : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(icon != null || isSelect != null) SizedBox(
                height: 18,
                width: 18,
                child: isSelect == null ? icon : (isSelect!
                    ? MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.light.stroke,  )
                    : MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.light.add, color: MyArtist.onSurface )),),
            if(title != null && title != "") const Gap(5),
            if(title != null && title != "") Flexible(
                child: Text(title ?? "",
                  style:(style ?? MyStyle.text.captionRegular10).copyWith(color: isSelect == true ? MyArtist.onPrimary : isSelect == false ? MyArtist.onSurface :  null),),
            ),
        ],
      ),
    );
  }
}
