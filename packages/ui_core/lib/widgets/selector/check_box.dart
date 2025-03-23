// ignore_for_file: depend_on_referenced_packages

import 'package:ui_core/src.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

// typedef TapCheckBox = void Function({bool isCheck});

class MyCheckBox extends StatefulWidget {
  final bool isCheck;
  final String? text;
  final Function({bool isCheck})? onTap;

  const MyCheckBox({
    super.key,
    this.isCheck = false,
    this.text,
    this.onTap,
  });

  @override
  State<StatefulWidget> createState() => _MyCheckBox();
}

class _MyCheckBox extends State<MyCheckBox> {
  bool check = false;

  void tapCheckBox() {
    setState(() {
      check = !check;
      widget.onTap?.call(isCheck: check);
    });
  }

  @override
  Widget build(BuildContext context) {
    check = widget.isCheck;

    return MyGestureContainer(
      onTap: tapCheckBox,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyAnimatedSwitcher(
            child: check
                ? MyAssets.icons.light.checkBox.svg(
                    height: 16,
                    width: 16,
                    colorFilter: ColorFilter.mode(MyArtist.onSurface2, BlendMode.srcIn),
                  )
                : MyAssets.icons.light.checkBoxEmpty.svg(
                    height: 16,
                    width: 16,
                    colorFilter: ColorFilter.mode(MyArtist.onSurface2, BlendMode.srcIn),
                  ),
          ),
          if (widget.text != null) const Gap(10),
          if (widget.text != null)
            Text(
              widget.text ?? "",
              style: MyStyle.text.smallTextRegular10.copyWith(color: MyArtist.onSurface2),
            ),
        ],
      ),
    );
  }
}
