import 'package:flutter/material.dart';

import 'package:ui_core/src.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key,
    this.children =  const <Widget>[],
    this.controllerSwitching,});

  final List<Widget> children;
  final MySwitchingController? controllerSwitching;

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {

  late PageController controller;
  late MySwitchingController controllerSwitching;

  @override
  void initState() {
    super.initState();
    controllerSwitching = widget.controllerSwitching ?? MySwitchingController();

    assert(controllerSwitching.selectedIndex < widget.children.length);
    controller = PageController(initialPage: controllerSwitching.selectedIndex);
    controller.addListener(() {
      if(controllerSwitching.selectedIndex != controller.page!.round()) {
        controllerSwitching.onSelect(controller.page!.round());
      }
    });

    controllerSwitching.addListener(() {
      if(controllerSwitching.selectedIndex < widget.children.length) {
        try {
          if (controller.hasClients) {
            controller.jumpToPage(controllerSwitching.selectedIndex);
          }
        } catch (e) {
          print(e);
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
    clipBehavior: Clip.antiAlias,
    physics: const MyBouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
    controller: controller,
    itemBuilder: (BuildContext context, int index) {
      return widget.children[index];
      },
    itemCount: widget.children.length,
    // children: widget.listScreen,
    );
  }
}
