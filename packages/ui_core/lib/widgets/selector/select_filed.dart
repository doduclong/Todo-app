
import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MySelectFiled extends FormField<String> {
  MySelectFiled(
      {super.key,
        required String title,
        String? detail,
        String? tag,
        Function()? onTap,
        Widget? icon,
        Gradient? gradient,
        double margin = 30,
        Widget? suffixIcon,
        super.onSaved,
        super.validator,
      })
      : super(
      autovalidateMode: AutovalidateMode.onUserInteraction,
    initialValue: detail,
    builder: (FormFieldState<String> state) {
        return _MySelectFiled(
          title: title,
          detail: detail,
          tag: tag,
          onTap: onTap,
          icon: icon,
          suffixIcon: suffixIcon,
          gradient: gradient,
          margin: margin,
          state: state,);
      },);
}

class _MySelectFiled extends StatelessWidget {
  final String title;
  final String? detail;
  final String? tag; // For Hero
  final Function()? onTap;
  final Widget? icon;
  final Widget? suffixIcon;
  final Gradient? gradient;
  final double margin;
  final FormFieldState<String> state;

  const _MySelectFiled({
    super.key,
    required this.title,
    this.detail,
    this.tag,
    this.onTap,
    this.icon,
    this.gradient,
    this.margin = 30,
    required this.state, this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return MyHero(
      tag: tag,
      child: MyAnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: margin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyGestureContainer(
              isEnable: onTap != null,
    onTap: onTap,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    // height: 50,
    constraints: const BoxConstraints(minHeight: 50),
    decoration: BoxDecoration(
            color: MyArtist.surface,
            gradient: gradient,
            borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
            children: [
              SizedBox(
                height: 18,
                  width: 18,
                  child: MyArtist.colorFilter.colorFilterWidget(icon ?? MyAssets.icons.light.calendar.svg(), color: MyArtist.onSurface, )),
              const Gap(10),
              Text(
                title,
                style: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface),
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
              if(detail != null) const Gap(10),
              if(detail != null) Expanded(
                child: Text(
                  detail ?? "",
                  style: MyStyle.text.captionRegular10.copyWith(color: MyArtist.onSurface),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                ),
              ) else const Spacer(),
              if(onTap != null || suffixIcon != null) const Gap(10),
              if(onTap != null || suffixIcon != null) suffixIcon ?? MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.light.next, color: MyArtist.onSurface ),
            ],
    ),
            ),
            if(state.hasError) Container(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              alignment: Alignment.centerLeft,
                child: Text(state.errorText ?? "", style: MyStyle.text.captionRegular10.copyWith(color: MyArtist.danger), ),),

          ],
        ),
      ),
    );
  }
}
