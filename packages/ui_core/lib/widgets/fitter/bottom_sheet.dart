import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyBottomSheetFitter extends StatefulWidget {
  final Widget? child;
  final double? initialChildSize;
  final double? maxChildSize;
  final double? minChildSize;
  final bool animationOn;
  final List<Widget> children;

  const MyBottomSheetFitter(
      {super.key,
        this.initialChildSize,
        this.maxChildSize,
        this.minChildSize,
        this.child,
        this.animationOn = true,
        this.children = const [],
      });

  @override
  State<StatefulWidget> createState() => _MyBottomSheetFitter();
}

class _MyBottomSheetFitter extends State<MyBottomSheetFitter> {
  bool isScroll = false;

  @override
  Widget build(BuildContext context) {
    return MyGestureContainer(
      // color: MyColors.background,
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          final isScrollHorizontal = scrollNotification.metrics.axisDirection == AxisDirection.right
              || scrollNotification.metrics.axisDirection == AxisDirection.left;

          if (scrollNotification is ScrollStartNotification &&
              widget.animationOn &&
              !isScrollHorizontal) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  isScroll = true;
                });
              }
            });
          } else if (scrollNotification is ScrollEndNotification &&
              widget.animationOn &&
              !isScrollHorizontal) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  isScroll = false;
                });
              }
            });
          }
          return true;
        },
        child: DraggableScrollableSheet(
        initialChildSize: widget.initialChildSize ?? 0.5,
        maxChildSize: widget.maxChildSize ?? 1,
        minChildSize: widget.minChildSize ?? 0.25,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return widget.children.isNotEmpty ? Stack(children: [
            MyHeaderBottomSheet(isScroll: isScroll, widget: widget, scrollController: scrollController),
            if(widget.children.isNotEmpty) for(final e in widget.children) e,
          ],)
          : MyHeaderBottomSheet(isScroll: isScroll, widget: widget, scrollController: scrollController);
        },
          ),
      ),
    );
  }
}

class MyHeaderBottomSheet extends StatelessWidget {
  const MyHeaderBottomSheet({
    super.key,
    required this.isScroll,
    required this.widget,
    required this.scrollController,
  });

  final bool isScroll;
  final MyBottomSheetFitter widget;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return MySingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          const Gap(10),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: MyArtist.onBackground.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            width: isScroll ? 4 : 50,
            height: isScroll ? 4 : 5,
          ),
          const Gap(25),
          if (widget.child != null) widget.child!,
        ],
      ),
    );
  }
}
