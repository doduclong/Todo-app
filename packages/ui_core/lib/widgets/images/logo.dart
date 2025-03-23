// ignore_for_file: depend_on_referenced_packages

import 'package:ui_core/src.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class MyLogo extends StatelessWidget {
  final String? tag;
  final Widget? logo;
  final String name;
  final String slogan;

  const MyLogo(
      {super.key,
      this.tag,
      this.logo,
      this.name = "CMC ATI",
      this.slogan = "Aspire to Inspire the Digital World",});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyHero(
              tag: tag,
              child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              logo ??
                  SizedBox(
                    width: 89.822,
                    child: MyArtist.gradient.blueLinearIconSVG( MyAssets.icons.logo.cmc, height: 60),
                  ),
              const Gap(10),
              MyAnimatedText(name,
                style: MyStyle.text.titleH4Bold20.copyWith(fontSize: 36),
                color: MyColor.blueLinear1,
              ),
            ],
              ),
            ),
            // const Gap(15),
            MyAnimatedText(slogan,
              style: MyStyle.text.textSubtitleRegular18.copyWith(color: MyArtist.onSurface),
              milliseconds: 100,
              textAlign: TextAlign.center,
              color: MyColor.blueLinear1,
            ),
          ],),
    );
  }
}
