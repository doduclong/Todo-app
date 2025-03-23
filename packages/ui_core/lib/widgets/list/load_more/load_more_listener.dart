import 'package:flutter/material.dart';

class MyLoadMoreListener extends StatelessWidget {
  final Widget child;
  final Function()? onLoadMore;

  const MyLoadMoreListener({super.key, required this.child, this.onLoadMore});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollNotification) {
        if (scrollNotification is ScrollEndNotification &&
            scrollNotification.metrics.pixels ==
                scrollNotification.metrics.maxScrollExtent) {
          onLoadMore?.call();
          return true;
        }
        return false;
      },
      child: child,
    );
  }
}
