import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';

class MyAppBarEmpty extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyArtist.background,
    );
  }

  @override
  Size get preferredSize => Size.zero;
}
