import 'package:flutter/cupertino.dart';
import 'package:ui_core/src.dart';

class MyProgressBar extends StatelessWidget{

  final double percent;
  final double height;

  const MyProgressBar({super.key,
     this.percent = 0,
    this.height = 10,}) : assert(percent >0 || percent <1, "MyProgressBar bảo là percent nằm trong (0,1)");

  @override
  Widget build(BuildContext context) {
    return MyTooltip(
      message: "${(percent*100).round()}%",
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: MyArtist.surface,
        ),
        height: height,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          alignment: Alignment.centerLeft,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return  AnimatedContainer(
                width: constraints.maxWidth * percent,
                decoration: BoxDecoration(
                  gradient: MyArtist.gradient.progressBarLinear(),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50,),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
                duration: const Duration(milliseconds: 500),
                height: height,
              );
            },
          ),
        ),
      ),
    );
  }
}
