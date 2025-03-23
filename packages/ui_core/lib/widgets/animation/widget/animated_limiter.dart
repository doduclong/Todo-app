import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyAnimatedLimiter extends StatelessWidget{
  final Widget child;

  const MyAnimatedLimiter({super.key, required this.child});


  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: child,);
  }
}