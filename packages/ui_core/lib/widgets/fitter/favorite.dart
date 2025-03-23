import 'package:flutter/cupertino.dart';
import 'package:ui_core/src.dart';

class MyFavorite extends StatelessWidget {

  final Widget child;
  final Widget? icon;
  final ColorFilter? colorFilter;
  final bool isFavorite;
  final double time;
  final String message;

  const MyFavorite({super.key,
    required this.child,
    this.icon,
    this.colorFilter,
    this.isFavorite = true,
    this.time = 1,
    this.message =  '',
  }) : assert(time >= 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          child,
          if(isFavorite) Positioned(
            top: -1,
            left: 20*time,
            child: MyTooltip(
              message: message,
              child: Container(
                width: 28*time,
                height: 32*time,
                padding: EdgeInsets.only(left: 7*time, right: 7*time, bottom: 8*time),
                decoration: BoxDecoration(
                  boxShadow: [MyArtist.shadow.cardShadow()],
                  image: DecorationImage(
                    colorFilter: colorFilter,
                    image: MyAssets.illustrations.favorite.provider(),
                  ),
                ),
                child: icon ?? MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.light.stroke, size: 14*time),
              ),
            ),
          ),
        ]
    );
  }
}
