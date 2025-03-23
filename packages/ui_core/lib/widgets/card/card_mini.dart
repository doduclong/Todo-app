import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyCardMini extends StatelessWidget{

  final String? title;
  final String? detail;

  const MyCardMini({super.key,
    this.title,
    this.detail,});


  @override
  Widget build(BuildContext context) {
    return MyGestureContainer(
      // width: 95,
      // height: 65,
      constraints: const BoxConstraints(
        minHeight: 65,
        minWidth: 95,
      ),
      padding: const EdgeInsets.only(top: 11, left: 10, right: 10 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [MyArtist.shadow.cardShadow()],
        color: MyArtist.background2,
      ),
      child: MyAnimatedSwitcher(
        child: Column(children: [
          if(detail != null)Text(detail ?? "", style: MyStyle.text.mediumTextMedium14.copyWith(foreground: MyArtist.gradient.foregroundGradient()),),
          if(detail != null && title != null) const Gap(5),
          if(title != null) Text(title ?? "", style: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface),),
        ],),
      ),
    );
  }
}
