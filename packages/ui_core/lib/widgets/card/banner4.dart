import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyBanner4 extends StatelessWidget {
  final Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final Widget? image;
  final String? title;
  final String? subTitle;
  final String textButton;
  final String? tag; // For Hero
  final int? badgeContent;

  const MyBanner4({
    super.key,
    this.onTap,
    this.margin = const EdgeInsets.symmetric(horizontal: 30),
    this.image,
    this.title,
    this.subTitle,
    this.textButton = "",
    this.tag,
    this.badgeContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      margin: margin,
      decoration: BoxDecoration(
        gradient: MyArtist.gradient.blueLinear(opacity: 0.2),
        borderRadius: BorderRadius.circular(22),
      ),
      alignment: Alignment.center,
      height: 210,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 26, 0, 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text.rich(
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      TextSpan(
                        text: title,
                        style: MyStyle.text.smallTextSemiBold12,
                        children: <TextSpan>[
                          TextSpan(
                            text: subTitle,
                            style: MyStyle.text.smallTextMedium12.copyWith(
                              foreground: MyArtist.gradient.foregroundGradient(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(15),
                  MyBadge(
                    badgeContent: badgeContent,
                    child: MyGestureContainer(
                      constraints: const BoxConstraints(
                        minWidth: 94,
                      ),
                      onTap: onTap,
                      // width: 94,
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: MyArtist.gradient.blueLinear(),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 19,
                        vertical: 10,
                      ),
                      child: Text(
                        textButton,
                        style: MyStyle.text.captionSemiBold10.copyWith(color: MyArtist.onPrimary),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MyHero(
            tag: tag,
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 116,
              ),
              padding: const EdgeInsets.fromLTRB(5, 30, 19, 31),
              child: image ?? MyAssets.illustrations.imageCalendar.svg(),
            ),
          ),
        ],
      ),
    );
  }
}
