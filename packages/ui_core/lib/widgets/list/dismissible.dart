import 'package:flutter/material.dart';

import 'package:ui_core/src.dart';

class MyDismissible extends StatelessWidget {
  const MyDismissible({super.key,
    required this.child,
    this.confirmDismiss,});

  final Widget child;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: MyArtist.surface,
        ),
        padding: const EdgeInsets.all(11),
        alignment: Alignment.centerRight,
        child: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.delete, color: MyArtist.onSurface, size: 18),
      ),
      key: ValueKey<Widget>(child),
      confirmDismiss: confirmDismiss,
      child: child,
    );
  }
}
