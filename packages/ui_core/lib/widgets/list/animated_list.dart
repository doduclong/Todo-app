import 'package:flutter/cupertino.dart';

class MyAnimatedList extends StatelessWidget{

  final int initialItemCount;
  final bool shrinkWrap;
  final Widget? Function(BuildContext, int) itemBuilder;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  final bool reverse;
  final Key? keyOfAnimationList;

  const MyAnimatedList({
    super.key,
    required this.initialItemCount,
    this.shrinkWrap = false,
    required this.itemBuilder,
    this.controller,
    this.padding,
    this.physics,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.keyOfAnimationList,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: keyOfAnimationList,
      reverse: reverse,
      scrollDirection: scrollDirection,
      padding: padding,
      controller: controller,
      shrinkWrap: shrinkWrap,
      initialItemCount: initialItemCount,
      physics: physics ??   const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context,int index, Animation<double> animation) {
        return SizeTransition(
            sizeFactor: animation,
            child: itemBuilder(context, index) ?? const SizedBox(),
        );
      },
      // itemBuilder: widget.itemBuilder,

    );
  }
}
