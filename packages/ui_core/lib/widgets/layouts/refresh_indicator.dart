import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';

class MyRefreshIndicator extends StatelessWidget {
  const MyRefreshIndicator({super.key, this.onRefresh, required this.child});

  final Function()? onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      strokeWidth: 1.2,
      color: MyArtist.onSurface,
      backgroundColor: MyArtist.surface,
      displacement: 32,
      onRefresh: () async {
        await onRefresh?.call();
      },
      child: child,
    );
  }
}
