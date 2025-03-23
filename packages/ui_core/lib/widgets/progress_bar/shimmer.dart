
import 'package:ui_core/src.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {

  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  const MyShimmer({super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ??  MyArtist.surface,
      highlightColor: highlightColor ?? MyArtist.background,
      period: const Duration(seconds: 1),
      child: child,
    );
  }
}
