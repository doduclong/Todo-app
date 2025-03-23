// ignore_for_file: avoid_dynamic_calls

import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyNestedScrollView extends StatelessWidget {
  final List<Widget> listSliverAppBar;
  final bool isUsedScrollView; // Cho phép quận màn hình
  final Widget child;
  final Function? onRefresh;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Future<bool> Function()? onWillPop;
  final bool resizeToAvoidBottomInset;


  const MyNestedScrollView(
      {super.key,
      this.isUsedScrollView = true,
      this.onRefresh,
      required this.child,
      this.floatingActionButton,
        this.floatingActionButtonLocation,
        required this.listSliverAppBar,
        this.onWillPop,
        this.resizeToAvoidBottomInset = true,
      });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          backgroundColor: MyArtist.background,
          body: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return listSliverAppBar;
            },
            body: (){
              if(isUsedScrollView && onRefresh != null){
                return MyRefreshIndicator(
                  onRefresh: () async {
                    await onRefresh?.call();
                  },
                  child: MySingleChildScrollView(
                    child: child,
                  ),
                );
              } else if (isUsedScrollView){
                return MySingleChildScrollView(
                  child: child,
                );
              } else if (onRefresh != null){
                return MyRefreshIndicator(
                  onRefresh: () async {
                    await onRefresh?.call();
                  },
                  child: child,
                );
              } else {
                return child;
              }
            }(),
          ),
        ),
      ),
    );
  }
}
