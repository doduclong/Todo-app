import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyCardUserItem extends StatelessWidget{

  final SvgGenImage svgGenImage;
  final String title;
  final Function()? onTap;
  final Widget? subIcon;

  const MyCardUserItem({
    super.key,
    required this.svgGenImage,
    required this.title,
    this.onTap,
    this.subIcon,
  });

  @override
  Widget build(BuildContext context) {
    return MyGestureContainer(
      color: MyArtist.background2,
      onTap: onTap,
      height: 30,
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: MyArtist.gradient.blueLinearIconSVG(svgGenImage,),
          ),
          const Gap(10),
          Expanded(
              child: Text(title, style: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface),),),
          subIcon ?? MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.arrowRight2, color: MyArtist.onSurface),
        ],
      ),);
  }
}
