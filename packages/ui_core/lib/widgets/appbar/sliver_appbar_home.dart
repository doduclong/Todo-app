// ignore_for_file: depend_on_referenced_packages

import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MySliverHomeAppBar extends StatefulWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;
  final double toolbarHeight;
  final String? subTitle;
  final String? mainTitle;
  final double padding;
  final bool centerTitle;
  final String? tag; // For Hero
  final bool? pinned;
  final bool? floating;
  final bool? snap;
  final PreferredSizeWidget? bottom;


  const MySliverHomeAppBar({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.elevation = 0.0,
    this.toolbarHeight = 102,
    this.subTitle,
    this.mainTitle,
    this.padding = 0,
    this.centerTitle = true,
    this.tag,
    this.pinned,
    this.floating,
    this.snap,
    this.bottom,
  });

  @override
  MySliverHomeAppBarState createState() => MySliverHomeAppBarState();
}

class MySliverHomeAppBarState extends State<MySliverHomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return MySliverAppBar(
      snap: widget.snap,
      pinned: widget.pinned,
      floating: widget.floating,
      centerTitle: widget.centerTitle,
      automaticallyImplyLeading: true,
      backgroundColor: widget.backgroundColor?? MyArtist.background,
      elevation: widget.elevation,
      toolbarHeight: widget.toolbarHeight,
      leadingWidth: MediaQuery.of(context).size.width,
      leading: const SizedBox.shrink(),
      flexibleSpace: widget.title ??
          Container(
            height: widget.toolbarHeight,
            padding: EdgeInsets.symmetric(
              horizontal: widget.padding,
            ),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                MyAnimatedText(
                  widget.subTitle ?? "",
                  style: MyStyle.text.textSubtitleRegular18
                      .copyWith(color: MyArtist.onSurface2),
                  color: MyArtist.onSurface2,
                ),
                const Gap(5),
                MyAnimatedText(
                  widget.mainTitle ?? "",
                  style: MyStyle.text.titleH4Bold20,
                ),
              ],
            ),
          ),
      actions: [...?widget.actions, Gap(widget.padding)],
      bottom: widget.bottom,
    );
  }
}
