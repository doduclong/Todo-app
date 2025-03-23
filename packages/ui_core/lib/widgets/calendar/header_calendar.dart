import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyHeaderCalendar extends StatelessWidget {

  final String? dateString;
  final Function()? onTapDateString;
  final Function()? onTapArrowLeft;
  final Function()? onTapArrowRight;

  const MyHeaderCalendar({super.key,
    this.dateString,
    this.onTapDateString,
    this.onTapArrowLeft,
    this.onTapArrowRight,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyIconButton(
          onTap: onTapArrowLeft,
          padding: 0,
          color: MyArtist.noColor,
          icon: SizedBox(
              height: 12,
              child: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.arrowLeft, color: MyArtist.onSurface2,),
    ),
        ),
        const Gap(12),
        MyGestureContainer(
          onTap: onTapDateString,
          child: Text(dateString ?? "",
            style: MyStyle.text.mediumTextRegular14.copyWith(color: MyArtist.onSurface2),
          ),
        ),
        const Gap(12),
        MyIconButton(
          onTap: onTapArrowRight,
          padding: 0,
          color: MyArtist.noColor,
          icon: SizedBox(
              height: 12,
              child: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.arrowRight2, color: MyArtist.onSurface2,),
    ),),

      ],);
  }
}
