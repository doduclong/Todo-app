import 'package:ui_core/src.dart';
import 'package:flutter/cupertino.dart';

class MySliverLayoutImageBackground extends StatelessWidget {

  final Widget child;

  const MySliverLayoutImageBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: MyArtist.gradient.blueLinear(),
      ),
      child: Stack(
        alignment:  AlignmentDirectional.center,
        children: [
          Positioned.fill(
            bottom: -80,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 44),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyArtist.background.withOpacity(0.3),
              ),
            ),
          ),
          child,],
      ),
    );
  }
}
