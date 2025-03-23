import 'package:flutter/cupertino.dart';

class MyAnimatedOpacity extends StatelessWidget{

  final Widget child;
  final double opacity;

  const MyAnimatedOpacity({super.key,
    required this.child,
    this.opacity = 1,}) : assert(opacity >=0 && opacity <=1, "opacity phải trong khoảng (0,1)");

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 100),
      child: child,);
  }
}

