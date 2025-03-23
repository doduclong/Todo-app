// ignore_for_file: depend_on_referenced_packages, avoid_dynamic_calls

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyBanner extends StatelessWidget {
  final Function()? onTap;
  final double margin;
  final Widget? image;
  final String title;
  final String? subTitle;
  final String textButton;
  final String? tag; // For Hero

  const MyBanner({
    super.key,
    this.onTap,
    this.margin = 0,
    this.image,
    this.title = "",
    this.subTitle,
    this.textButton = "",
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 400,
        // minHeight: 174,
      ),
      margin: EdgeInsets.symmetric(horizontal: margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: MyArtist.gradient.blueLinear(opacity: 0.2),
        boxShadow: [MyArtist.shadow.cardShadow()],
      ),
      height: 210,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        style: MyStyle.text
                            .myTextStyleForHero(textStyle: MyStyle.text.mediumTextMedium14, context: context),
                        maxLines: 2,
                      ),
                      if (subTitle != null)
                        Text(
                          subTitle ?? "",
                          style: MyStyle.text.myTextStyleForHero(
                            textStyle: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface),
                            context: context,
                          ),
                          maxLines: 3,
                        ),
                    ],
                  ),
                  const Gap(15),
                  MyGestureContainer(
                    onTap: onTap,
                    // width: 94,
                    constraints: const BoxConstraints(
                      minWidth: 94,
                    ),
                    // alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: MyArtist.background2,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text(
                        textButton,
                        style: MyStyle.text.myTextStyleForHero(
                          textStyle: MyStyle.text.captionRegular10.copyWith(
                            foreground: MyArtist.gradient.foregroundGradient(),
                          ),
                          context: context,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 100,
              ),
              child: MyHero(
                tag: tag,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyArtist.background2.withOpacity(0.5),
                          ),
                          height: 115,
                          width: 115,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: image ?? const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
