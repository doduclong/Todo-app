import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/widgets/src.dart';

class MyListView extends StatelessWidget{

  final int? itemCount;
  final bool shrinkWrap;
  final Widget? Function(BuildContext, int)? itemBuilder; // Dành cho builder
  final Widget? Function(BuildContext, int)? separatorBuilder; // Dành cho builder
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  final bool reverse;
  final double paddingStartAndEnd;
  final List<Widget>? children; // Dành cho build thường
  final double? minHeight;


  const MyListView({super.key,
    this.itemCount,
    this.shrinkWrap = false,
    this.itemBuilder,
    this.controller,
    this.physics,
    this.padding,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.paddingStartAndEnd = 0,
    this.children,
    this.minHeight,
    this.separatorBuilder,
  }) : assert(children != null ||  (itemBuilder != null && itemCount != null),
  "children vs (itemBuilder, itemCount) chỉ sử dụng 1 trong 2",);

  @override
  Widget build(BuildContext context) {
    return MyAnimatedContainer(
      constraints: BoxConstraints(minHeight: minHeight ?? 0),
      child: MyAnimatedLimiter(
        child: ListView.separated(
          // primary: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          reverse: reverse,
          scrollDirection: scrollDirection,
          padding:  padding ?? EdgeInsets.zero,
          controller: controller,
          shrinkWrap: minHeight != null || shrinkWrap,
          physics: physics ?? const BouncingScrollPhysics(
            // parent: RangeMaintainingScrollPhysics(),
          ),
          itemCount: children == null ? itemCount! : children!.length,
          itemBuilder: (context, index) =>
              MyAnimatedLimiterItem(
                  index: index,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left:  scrollDirection == Axis.horizontal && index == 0 ? paddingStartAndEnd :  0,
                      top:  scrollDirection == Axis.vertical && index == 0 ? paddingStartAndEnd :  0,
                      right: scrollDirection == Axis.horizontal && index == (children == null ? itemCount! : children!.length) - 1 ? paddingStartAndEnd : 0,
                      bottom: scrollDirection == Axis.vertical && index == (children == null ? itemCount! : children!.length) - 1 ? paddingStartAndEnd : 0,
                    ),
                    child: MyVisibility(
                        visible: children == null,
                        replacement: children == null  ? const SizedBox.shrink() : children![index],
                        child: itemBuilder == null  ? const SizedBox.shrink() : itemBuilder!(context, index),),
                  ),
              ),
          separatorBuilder:  (context, index) =>   MyAnimatedLimiterItem(
              index: index,
              child:  MyVisibility(
                  visible: separatorBuilder == null,
                  replacement: separatorBuilder == null ? const SizedBox.shrink() :  separatorBuilder!(context, index),
                  child: const Gap(15),
            ),
          ),
        ),
      ),
    );
  }
}
