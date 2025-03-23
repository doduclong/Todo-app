import 'package:flutter/material.dart';

class MyWrap extends StatelessWidget {

  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  const MyWrap({super.key,
    this.children = const <Widget>[],
    this.padding = const EdgeInsets.symmetric(horizontal: 30),});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        children: children,
      ),
    );
  }
}
