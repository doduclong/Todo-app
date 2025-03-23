// ignore_for_file: depend_on_referenced_packages, avoid_dynamic_calls

import 'package:ui_core/src.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class MySimpleItem extends StatelessWidget {
  final String? title;
  final String? detail;
  final double padding;
  final Function? onTap;
  final Widget? icon;
  final List<Widget>? icons;

  const MySimpleItem({
    super.key,
    this.title,
    this.detail,
    this.padding = 0.0,
    this.onTap,
    this.icon,
    this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(title != null) Text(
                  title ?? "",
                  style: MyStyle.text.textLargeBold16,
                ),
                if(detail != null ||  title != null) const Gap(5),
                if(detail != null) Text(
                  detail ?? "",
                  style: MyStyle.text.smallTextRegular12
                      .copyWith(color: MyArtist.onSurface),
                ),
              ],
            ),
          ),
          const Gap(11),
          if(icons != null) ...icons!,
          MyIconButton(
            color: MyArtist.background,
            onTap: onTap,
            boxShadow: [MyArtist.shadow.cardShadow()],
            size: 32,
            padding: 8,
            icon: icon ??  MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.x, color: MyArtist.onBackground,),
          ),
        ],
      ),
    );
  }
}
