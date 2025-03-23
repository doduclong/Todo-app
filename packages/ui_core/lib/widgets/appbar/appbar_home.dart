// ignore_for_file: depend_on_referenced_packages

import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyHomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;
  final AppBar? appBar;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;
  final double toolbarHeight;
  final String? subTitle;
  final String? mainTitle;
  final double padding;
  final bool centerTitle;
  final String? tag; // For Hero
  final PreferredSizeWidget? bottom;

  const MyHomeAppBar(
      {super.key,
      this.title,
      this.appBar,
      this.actions,
      this.backgroundColor,
      this.elevation = 0.0,
      this.toolbarHeight = 100,
      this.subTitle,
      this.mainTitle,
      this.padding = 0,
      this.centerTitle = false,
        this.tag,
        this.bottom,});

  @override
  MyHomeAppBarState createState() => MyHomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight((appBar ??
          AppBar(
            toolbarHeight: toolbarHeight,
          ))
      .preferredSize
      .height,);
}

class MyHomeAppBarState extends State<MyHomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return HeroMode(
        enabled: widget.tag != null,
        child: Hero(
          tag: widget.tag ?? "",
          child: AppBar(
          centerTitle: widget.centerTitle,
          backgroundColor: widget.backgroundColor?? MyArtist.background,
          elevation: widget.elevation,
          toolbarHeight: widget.toolbarHeight,
          title: widget.title ??
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widget.padding, vertical: widget.padding,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyAnimatedText(widget.subTitle ?? "",
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
        ),
      ),
    );
  }
}
