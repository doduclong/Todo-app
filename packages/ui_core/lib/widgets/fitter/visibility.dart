import 'package:flutter/material.dart';

class MyVisibility extends StatelessWidget {

  final bool visible;
  final Widget? replacement;
  final Widget? child;

  const MyVisibility({super.key,
     this.visible = true,
     this.replacement,
     this.child,});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      // maintainState: true,
      visible: visible,
      replacement: replacement ?? const SizedBox.shrink(),
      child: child ?? const SizedBox.shrink(),
    );
  }
}
