import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';

class MyLayout extends StatelessWidget {
  const MyLayout({
    super.key,
    this.appBar = const MyAppBarEmpty(),
    required this.body,
    this.backgroundColor,
    this.drawer,
    this.endDrawer,
    this.resizeToAvoidBottomInset = true,
    this.scaffoldKey,
    this.isUsedScrollView = true,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.onRefresh,
    this.onWillPop,
  });

  final PreferredSizeWidget appBar;
  final Widget body;
  final Color? backgroundColor;
  final Widget? drawer;
  final Widget? endDrawer;
  final bool resizeToAvoidBottomInset;
  final Key? scaffoldKey;
  final bool isUsedScrollView; // Cho phép quận màn hình
  final bool extendBodyBehindAppBar; // Cho phép hiển thị full màn hình.
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Function()? onRefresh;
  final Future<bool> Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child:GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: appBar,
      drawer: drawer,
      endDrawer: endDrawer,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor?? MyArtist.background,
      body: (){
          if(isUsedScrollView && onRefresh != null){
            return MyRefreshIndicator(
              onRefresh: () async {
                await onRefresh?.call();
              },
              child: MySingleChildScrollView(
                child: body,
              ),
            );
          } else if (isUsedScrollView){
            return MySingleChildScrollView(
              child: body,
            );
          } else if (onRefresh != null){
            return MyRefreshIndicator(
              onRefresh: () async {
                await onRefresh?.call();
              },
              child: body,
            );

          } else {
            return body;
          }
      }(),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
        ),
      ),
    );
  }
}
