import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyCard extends StatelessWidget {

  final Function()? onTap;
  final Widget? image;
  final String title;
  final String subTitle;
  final String textButton;
  final String? tag; // For Hero
  final bool purpleLinearColor;

  const MyCard({super.key,
    this.onTap,
    this.image,
    required this.title,
    required this.subTitle,
    required this.textButton,
    this.tag,
    this.purpleLinearColor = false,});

  @override
  Widget build(BuildContext context) {
    return  Container(
    height: 239,
    width: 200,
    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: purpleLinearColor
      ? MyArtist.gradient.purpleLinear(opacity: 0.2)
      : MyArtist.gradient.blueLinear(opacity: 0.2),
    ),
    alignment: Alignment.center,
    child: Column(
      children: [
    Expanded(
      child: MyHero(
        tag: tag,
        child: Container(
          height: 116,
          width: 116,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyArtist.background2,
          ),
          child: Center(
            child: image,
          ),
        ),
      ),
    ),
    const Gap(15),
    Text(title,
      style: MyStyle.text.myTextStyleForHero(textStyle: MyStyle.text.mediumTextMedium14, context: context),
      textAlign: TextAlign.center,
      overflow: TextOverflow.visible,
      maxLines: 1,
    ),
    const Gap(5),
    Text(subTitle,
      style: MyStyle.text.myTextStyleForHero(textStyle: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface), context: context),
      textAlign: TextAlign.center,
      overflow: TextOverflow.visible,
      maxLines: 2,
    ),
    const Gap(15),
    MyGestureContainer(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      // height: 38,
      constraints: const BoxConstraints(minHeight: 38),
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          gradient: purpleLinearColor ? null : MyArtist.gradient.blueLinear(),
      ),
      child: Text(textButton,
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
        maxLines: 1,
        style: purpleLinearColor
            ? MyStyle.text.myTextStyleForHero(textStyle: MyStyle.text.smallTextSemiBold12.copyWith(foreground: MyArtist.gradient.foregroundGradient(gradient: MyArtist.gradient.purpleLinear())), context: context)
        : MyStyle.text.myTextStyleForHero(textStyle: MyStyle.text.smallTextSemiBold12.copyWith(color: MyArtist.onPrimary), context: context),),
    ),
      ],
    ),);
  }
}
