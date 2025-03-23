// ignore_for_file: depend_on_referenced_packages, avoid_dynamic_calls

import 'package:ui_core/src.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class MyTextButton extends StatelessWidget {
  final Function? onTap;
  final Widget? icon;
  final bool ltr;
  final String? text;
  final double margin;
  final String? tag; // For Hero
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final TextStyle? style;
  final bool isEnable;

  const MyTextButton({
    super.key,
    this.onTap,
    this.icon,
    this.text,
    this.margin = 30,
    this.ltr = true,
    this.tag,
    this.color,
    this.boxShadow,
    this.style,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return MyHero(
      tag: tag,
      child:MyOpacity(
        enable: isEnable,
        child: MyGestureContainer(
        onTap: (){
          onTap?.call();
        },
        margin: EdgeInsets.symmetric(horizontal: margin, vertical: 20),
          alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color:  color,
            gradient:  color == null ? MyArtist.gradient.blueLinear() : null ,
            boxShadow:  boxShadow ?? [MyArtist.shadow.blueShadow()] ,),
        child: Row(
          textDirection: ltr ? TextDirection.ltr : TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null) const Gap(10),
            if (text != null)
              Text(text ?? "",
                  style: MyStyle.text.myTextStyleForHero(textStyle: style ?? MyStyle.text.textLargeBold16
                            .copyWith(color: MyArtist.onPrimary),
                    context: context,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
