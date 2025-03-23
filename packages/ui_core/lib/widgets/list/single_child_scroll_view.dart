import 'package:flutter/material.dart';

class MySingleChildScrollView extends StatelessWidget {

  final Widget child;
  final ScrollController? controller;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final EdgeInsetsGeometry? padding;

  const MySingleChildScrollView({super.key,
    required this.child,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
    this.controller,
    this.padding,
    });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding,
      controller: controller,
      keyboardDismissBehavior: keyboardDismissBehavior,
      physics: const BouncingScrollPhysics(),
      child: child,
    );
  }
}
