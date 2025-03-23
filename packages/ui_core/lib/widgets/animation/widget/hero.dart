import 'package:flutter/material.dart';

class MyHero extends StatelessWidget {
  final String? tag; // For Hero
  final Widget child;
  const MyHero({super.key, this.tag, required this.child});

  @override
  Widget build(BuildContext context) {
    return HeroMode(
        enabled: tag != null,
        child: Hero(
        tag: tag ?? "",
        child: child ),);
  }
}
