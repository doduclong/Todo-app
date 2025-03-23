import 'package:flutter/material.dart';
import 'package:helper_package/package_interpreter/package_interpreter.dart';

import 'package:ui_core/src.dart';

class MyLoadMorePage extends StatelessWidget {
  const MyLoadMorePage({super.key,
    required this.child,
    this.minHeight,
    this.shrinkWrap = false,
    this.isShowProgress = false,
    this.isEnd = false,
    this.isHidden = false,
    this.paddingStartAndEnd = 0,
  });

  final Widget child;
  final double? minHeight;
  final bool shrinkWrap;
  final bool isShowProgress;
  final bool isEnd;
  final bool isHidden;
  final double paddingStartAndEnd;

  @override
  Widget build(BuildContext context) {
    return MyListView(
      paddingStartAndEnd: paddingStartAndEnd,
      minHeight: minHeight,
      shrinkWrap: shrinkWrap,
      children: [
        child,
        if(!isHidden) MyAnimatedContainer(
          height: isEnd == true ? 0 : null,
          duration: 500,
          color: MyArtist.background,
          child: MyProgressSimple(
            icon: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.arrowDownCircle, color: MyArtist.onBackground),
            isShowProgress: isShowProgress,
            detail: isEnd == true
                ? ""
                : isShowProgress
                ? MyPackageInterpreter.loadingMore
                : MyPackageInterpreter.loadMore,
          ),
        ),
      ],
    );
  }
}
