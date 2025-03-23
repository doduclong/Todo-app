// ignore_for_file: depend_on_referenced_packages

import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MySliverAppBar extends StatefulWidget {
  final Widget? title; /// Error: Hiện tại title chỉ hiển thị được Text. Hãy thêm widget muốn hiển thị vào leading
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;
  final double padding;
  final bool automaticallyImplyLeading; // tự động lấp đầy leading khi nó rỗng.
  final Widget? leading;
  final bool? centerTitle;
  final double toolbarHeight;
  final double? leadingWidth;
  final bool? pinned;
  final double? expandedHeight;
  final Widget? flexibleSpace;
  final double? titleSpacing;
  final bool? floating;
  final bool stretch;
  final bool? snap;
  final PreferredSizeWidget? bottom;

  const MySliverAppBar({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.elevation = 0.0,
    this.padding = 0.0,
    this.automaticallyImplyLeading = false,
    this.leading,
    this.centerTitle = true,
    this.toolbarHeight = kToolbarHeight,
    this.leadingWidth,
    this.pinned,
    this.expandedHeight,
    this.flexibleSpace,
    this.titleSpacing,
    this.floating,
    this.stretch = false,
    this.snap,
    this.bottom,
  });

  @override
  MySliverAppBarState createState() => MySliverAppBarState();

}

class MySliverAppBarState extends State<MySliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: widget.expandedHeight,
      flexibleSpace: widget.flexibleSpace,
      titleSpacing: widget.titleSpacing,
      toolbarHeight: widget.toolbarHeight,
      leadingWidth: widget.leadingWidth,
      floating: widget.floating ?? true,
      stretch: widget.stretch,
      pinned: widget.pinned ?? false,
      snap: widget.snap ?? true,
      centerTitle: widget.centerTitle,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      backgroundColor: widget.backgroundColor?? MyArtist.background,
      elevation: widget.elevation,
      leading:  Container(
        padding: EdgeInsets.only(left: widget.padding),
        child: widget.leading ?? MyIconButton(
          onTap: (){
            Navigator.of(context).pop();
          },
          size: 32,
          padding: 8,
          icon: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.back, color: MyArtist.onBackground,),
        ),
      ),
      title: widget.title,
      actions: [...?widget.actions, Gap(widget.padding)],
      bottom: widget.bottom,

    );
  }
}


