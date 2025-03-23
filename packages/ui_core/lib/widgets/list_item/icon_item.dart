// ignore_for_file: avoid_dynamic_calls

import 'package:ui_core/src.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class MyIconItem extends StatelessWidget {

  final double padding;
  final Widget icon;
  final Widget? suffixIcon;
  final String? title;
  final String? detail;
  final Function()? onTap;
  final int index; // hiển thị màu chẵn lẻ.

  const MyIconItem({
    super.key,
    this.padding = 20,
    required this.icon,
    this.title,
    this.detail,
    this.onTap,
    this.index = 0,
    this.suffixIcon,});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      constraints: const BoxConstraints(minHeight: 60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: MyArtist.background,
      ),
        margin: EdgeInsets.symmetric(horizontal: padding),
        child: Row(
          children: [
            Container(
                alignment: Alignment.center,
              height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: index.isEven
                      ? MyArtist.gradient.blueLinear(opacity: 0.2)
                      : MyArtist.gradient.purpleLinear(opacity: 0.2),
                ),
                child:  Container(
                    width: 40,
                    height: 41,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyArtist.background,
                    ),
                    child: icon,),),
            const Gap(10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                  Text(title ?? "", style: MyStyle.text.mediumTextMedium14,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  if (title != null && detail != null)
                  const Gap(3),
                  if (detail != null)
                  Text(detail ?? "", style: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface),
                  overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            MyGestureContainer(
              height: 60,
                onTap:  onTap,
                width: 24,
              child: suffixIcon ??  MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.light.iconNext, color:  MyArtist.onSurface2),
          ),
        ],
      ),
    );
  }
}
