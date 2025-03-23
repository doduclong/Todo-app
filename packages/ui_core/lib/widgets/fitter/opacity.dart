import 'package:flutter/cupertino.dart';
import 'package:ui_core/src.dart';

class MyOpacity extends StatelessWidget {

  final bool enable;
  final Widget child;
  final String message;

  const MyOpacity({
    super.key,
    this.enable = true,
    required this.child,
     this.message = '',});

  @override
  Widget build(BuildContext context) {
    return MyTooltip(
      message: enable ? '' : message,
      child: MyAnimatedOpacity(
          opacity:  enable ? 1 : 0.3,
          child: AbsorbPointer(
              absorbing: !enable,
              child: child,),),
    );
  }
}
