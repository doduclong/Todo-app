import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyCardUser extends StatelessWidget{

  final double margin;
  final double padding;
  final String? title;
  final List<Widget>? children;
  final int duration;

  const MyCardUser({super.key,
     this.margin = 30,
     this.padding = 20,
    this.title,
    this.children,
    this.duration = 100,});

  @override
  Widget build(BuildContext context) {
    return  MyAnimatedContainer(
        duration: duration,
        margin:  EdgeInsets.symmetric(horizontal: margin),
        padding:  EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: MyArtist.background2,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [ if(MyArtist.isBrightnessLight) MyArtist.shadow.cardShadow(),],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(title != null) Text(title ?? "", style: MyStyle.text.textLargeSemiBold16,),
            if(title != null) const Gap(10),
            if(children != null) ...?children,
          ],
        ),);
  }
}