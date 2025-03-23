import 'package:ui_core/widgets/src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyColumn extends StatelessWidget{
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;

  const MyColumn({super.key,
    required this.children,
     this.mainAxisAlignment = MainAxisAlignment.start,
     this.mainAxisSize = MainAxisSize.max,
     this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,});


  @override
  Widget build(BuildContext context) {
    return MyAnimatedLimiter(
      child: Column(
        textDirection: textDirection,
          mainAxisAlignment : mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 200),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 20,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: children,
        ),
      ),);
  }
}