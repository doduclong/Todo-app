import 'package:flutter/cupertino.dart';

class MyAnimatedSwitcher extends StatelessWidget{

  final Widget child;
  final int duration;


  const MyAnimatedSwitcher({super.key,
    required this.child,
    this.duration = 100,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        switchInCurve: Curves.easeOutQuint,
      switchOutCurve: Curves.easeInQuint,
      duration: Duration(milliseconds: duration),
      reverseDuration: Duration(milliseconds: duration~/1.5),
      // transitionBuilder: (Widget child, Animation<double> animation) {
      //   return ScaleTransition(scale: animation, child: child);
      // },
      child: Container(
        key: ValueKey<Widget>(child),
          child: child,),);
  }
}
