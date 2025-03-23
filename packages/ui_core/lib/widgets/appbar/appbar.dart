// ignore_for_file: depend_on_referenced_packages

import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;
  final AppBar? appBar;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;
  final double padding;
  final bool automaticallyImplyLeading; // tự động lấp đầy leading khi nó rỗng.
  final Widget? leading;
  final bool? centerTitle;
  final double? leadingWidth;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final Function()? onCallback;

  const MyAppBar({
    super.key,
    this.title,
    this.appBar,
    this.actions,
    this.backgroundColor ,
    this.elevation = 0.0,
    this.padding = 0.0,
    this.automaticallyImplyLeading = false,
    this.leading,
    this.centerTitle = true,
    this.leadingWidth,
    this.bottom,
    this.toolbarHeight,
    this.onCallback,
  });

  @override
  MyAppBarState createState() => MyAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight((appBar ?? AppBar(  )).preferredSize.height);
}

class MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: widget.toolbarHeight,
      leadingWidth: widget.leadingWidth,
      centerTitle: widget.centerTitle,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      backgroundColor: widget.backgroundColor ?? MyArtist.background,
      elevation: widget.elevation,
      leading:  Container(
        padding: EdgeInsets.only(left: widget.padding),
        child: widget.leading ?? MyIconButton(
          onTap: (){
            widget.onCallback?.call();
            Navigator.of(context).pop();
          },
          size: 32,
          padding: 8,
          icon: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.back, color: MyArtist.onBackground,),
        ),
      ),
      title: widget.title,
      bottom: widget.bottom,
      actions: [...?widget.actions, Gap(widget.padding)],
    );
  }
}
