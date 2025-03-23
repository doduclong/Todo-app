import 'package:flutter/material.dart';

class MySliverPersistentHeader extends StatelessWidget {

  final Widget child;
  final double height;

  const MySliverPersistentHeader({super.key,
    required this.child,
    this.height = kToolbarHeight});


  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: MySliverPersistentHeaderDelegate(
        preferredSize: PreferredSize(
        preferredSize: Size.fromHeight(height),
    child: child,)
      ),
      pinned: true,
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate({required this.preferredSize});

  final PreferredSize preferredSize;

  @override
  double get minExtent => preferredSize.preferredSize.height;
  @override
  double get maxExtent => preferredSize.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return preferredSize;
  }

  @override
  bool shouldRebuild(MySliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
