// ignore_for_file: depend_on_referenced_packages

import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class MySliverLayout extends StatefulWidget {
  final double? expandedHeader;
  final Widget image;
  final Widget child;
  final String? title;
  final double padding;
  final List<Widget>? actions;
  final Widget? leading;
  final Future<bool> Function()? onWillPop;
  final Function()? onStretchTrigger;

  const MySliverLayout(
      {super.key,
        this.expandedHeader,
      required this.image,
      required this.child,
      this.title,
      this.padding = 0.0,
        this.actions,
        this.leading, this.onWillPop,
        this.onStretchTrigger,});

  @override
  State<StatefulWidget> createState() => _MySliverLayout();
}

class _MySliverLayout extends State<MySliverLayout> {
  bool isExpanded = true;

  void changeIsExpanded({required bool isExpanded}) {
    setState(() {
      this.isExpanded = isExpanded;
    });
  }

  double bottom = -10;

  void changeBottom(double pixels) {
    setState(() {
      if (pixels > 0) {
        bottom = pixels * 0.75 - 12;
      } else {
        bottom = -10;
      }
    });
  }

  bool isScroll = false;

  @override
  Widget build(BuildContext context) {
    final double expandedHeader =
        widget.expandedHeader ?? MediaQuery.of(context).size.height * 0.5;

    return WillPopScope(
      onWillPop: widget.onWillPop,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: MyArtist.background,
        body: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {

              final isScrollHorizontal = scrollNotification.metrics.axisDirection == AxisDirection.right
                  || scrollNotification.metrics.axisDirection == AxisDirection.left;

              if (scrollNotification is ScrollStartNotification && !isScrollHorizontal) {
                setState(() {
                  isScroll = true;
                });
              } else if (scrollNotification is ScrollUpdateNotification && !isScrollHorizontal) {

                final pixels = scrollNotification.metrics.pixels;

                changeBottom(pixels);
                if (expandedHeader - pixels <= kToolbarHeight) {
                  if (isExpanded) changeIsExpanded(isExpanded: false);
                } else {
                  if (!isExpanded) changeIsExpanded(isExpanded: true);
                }
              } else if (scrollNotification is ScrollEndNotification && !isScrollHorizontal) {
                setState(() {
                  isScroll = false;
                });
              }


              return false;
            },
            child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(parent:  BouncingScrollPhysics() ),
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    stretch: true,
                    elevation: 0,
                    expandedHeight: expandedHeader,
                    onStretchTrigger: () async  {
                        widget.onStretchTrigger?.call();
                    },
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: const [
                        StretchMode.zoomBackground,
                        // StretchMode.blurBackground,
                        StretchMode.fadeTitle,
                      ],
                        background: Stack(children: [
                      Positioned.fill(
                        child: widget.image,
                      ),
                      Positioned(
                        bottom: bottom,
                        left: -1,
                        right: -1,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: MyArtist.background,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                width: isScroll ? 4 : 50,
                                height: isScroll ? 4 : 5,
                                decoration: BoxDecoration(
                                  color: MyArtist.onBackground.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],),
                        //Images.network
                        ),
                    backgroundColor: MyArtist.background,
                    centerTitle: true,
                    titleSpacing: 0,
                    title: MyVisibility(
                            visible: isExpanded || widget.title == null,
                            replacement: Text(
                                widget.title ?? "",
                                style: MyStyle.text.textLargeBold16,
                              ),
                          ),
                    leading: Container(
                      padding: EdgeInsets.only(left: widget.padding),
                      child: widget.leading ?? MyIconButton(
                        onTap: () {
                           Navigator.of(context).pop();
                        },
                        size: 32,
                        padding: 8,
                        icon: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.back, color: MyArtist.onBackground,),

                      ),
                    ),
                    actions: [
                      ...?widget.actions, Gap(widget.padding),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                        child: widget.child,),
              ),
            ],
          ),),
        ),
      ),
    );
  }
}
