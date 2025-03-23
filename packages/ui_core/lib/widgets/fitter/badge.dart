import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:ui_core/src.dart';

class MyBadge extends StatelessWidget {
  final int? badgeContent;
  final Widget? child;
  final int? animationDuration;
  final Color? badgeColor;

  const MyBadge({super.key,
    this.badgeContent,
    this.child,
    this.animationDuration,  this.badgeColor,});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.custom(top: -15, end: -15),
      badgeAnimation:  badges.BadgeAnimation.rotation(
        animationDuration: Duration(milliseconds: animationDuration ?? 200),
        colorChangeAnimationDuration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: badges.BadgeStyle(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: MyArtist.background, width: 1.2),
        badgeGradient:  badgeColor == null  ? const badges.BadgeGradient.linear(
          begin: Alignment.bottomRight,
          end:  Alignment(-1.479, -1.615),
          colors: [
            MyColor.purpleLinear1,
            MyColor.purpleLinear2,
          ],
          stops:  <double>[0, 1],
        ) : null,
        badgeColor: badgeColor ?? MyArtist.danger,
        elevation: 0,
      ),
      showBadge: badgeContent != 0 && badgeContent != null,
      badgeContent: badgeContent == 0 || badgeContent == null ? null
          : Padding(
            padding: const EdgeInsets.all(2.2),
            child: Text('$badgeContent',
            style: MyStyle.text.captionRegular10.copyWith(color: MyColor.white),
              ),
            ),
      child: child,);
  }
}
