// ignore_for_file: depend_on_referenced_packages

import 'package:another_flushbar/flushbar.dart';
import 'package:helper_package/src.dart';
import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class $MyDialogHelper {
  const $MyDialogHelper();

  Future showMyFlushBar({
    required BuildContext context,
    required String title,
    required String message,
    Color? backgroundColor,
    int? duration,
  }) {
    return Flushbar(
      borderWidth: 0.8,
      borderColor: MyArtist.onSurface3,
      backgroundColor: backgroundColor ?? MyArtist.background,
      titleText: Text(
        title,
        style: MyStyle.text.mediumTextMedium14,
      ),
      messageText: Text(
        message,
        style: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface),
      ),
      duration: Duration(seconds: duration ?? 3),
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(16),
      mainButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 27),
        child: Container(
            width: 26,
            padding: const EdgeInsets.all(5),
            height: 26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: MyArtist.gradient.purpleLinear(opacity: 0.1),),
            child: MyAssets.icons.light.bell.svg(height: 16, width: 16),),
      ),
    ).show(context).catchError((error, stackTrace) {
      myPrint(error);
    });
  }

   void showMyLoadingFullLayout({
    required BuildContext context,
  }){
    showDialog(
      barrierDismissible: false, // Không cho tắt khi ấn ra ngoài.
      barrierColor: MyArtist.onBackground.withOpacity(0.05),
      context: context,
      builder: (context) => const Center(
          child: MyProgressCircular(),
      ),
    );
  }

  void showMyDialog({
    required String title1,
    required String title2,
    String? detail,
    String? textButton,
    Function? onTap,
    required BuildContext context,
  }) {
    showDialog(
      barrierColor: MyArtist.onBackground.withOpacity(0.05),
      context: context,
      builder: (context) => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: MyArtist.background,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    top: 0,
                    left: 4,
                    child: MyIconButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      padding: 0,
                      size: 20,
                      color: MyArtist.noColor,
                      icon: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.x, color: MyArtist.onBackground, size: 20),
                    ),
                  ),
                  Center(
                    child: Text(
                      title1,
                      style: MyStyle.text.myTextStyleForHero(
                          textStyle: MyStyle.text.textLargeSemiBold16,
                          context: context,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Text(
                title2,
                style: MyStyle.text.myTextStyleForHero(
                    textStyle: MyStyle.text.mediumTextMedium14,
                    context: context,),
              ),
              if(detail != null )const Gap(10),
              if(detail != null ) Text(detail,
                  style: MyStyle.text.myTextStyleForHero(
                      textStyle: MyStyle.text.smallTextRegular12
                          .copyWith(color: MyArtist.onSurface),
                      context: context,),),
              if(textButton != null ) const Gap(30),
              if(textButton != null ) MyTextButton(
                margin: 0,
                text: textButton,
                color: MyColor.darkThemeDarkAccent,
                onTap: onTap,
              )
            ],
          ),
        ),
      ),
    );
  }

  void showMySnackBar({
    required BuildContext context,
    String? message,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: SizedBox(
            // height: 18,
            child: Row(
              children: [
                MyAssets.icons.bold.infoCircle.svg(height: 18, width: 18, colorFilter: MyArtist.colorFilter.srcIn(color: MyArtist.background)),
                const Gap(5),
                Text(message ?? "", style: MyStyle.text.captionRegular10.copyWith(color: MyArtist.background),),
              ],
            ),
          ),
            backgroundColor: MyArtist.onBackground,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            elevation: 4,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            showCloseIcon: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),

      );

}
