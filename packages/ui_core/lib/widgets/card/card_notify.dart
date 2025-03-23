import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyCardNotify extends StatefulWidget{

  final String? title;
  final String? detail;

  const MyCardNotify({super.key,
    this.detail,
    this.title,});

  @override
  State<StatefulWidget> createState() => _MyCardNotify();

}

class _MyCardNotify extends State<MyCardNotify>{

  double height = 90;
  double opacity = 1;

  void onClose(){
    setState(() {
      height = 0;
      opacity = 0;
    });
  }

  bool isClosed = false;
  void onEnd() {
    setState(() {
      isClosed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MyVisibility(
        visible: !isClosed,
        child: MyAnimatedOpacity(
          opacity: opacity,
          child: MyAnimatedContainer(
          onEnd: onEnd,
          margin: const EdgeInsets.symmetric(horizontal: 30),
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyArtist.danger.withOpacity(0.1),
            ),
            duration: 300,
            child: MyVisibility(
              visible: height > 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 15, 10, 15),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: MyArtist.background,
                    ),
                    child: MyAssets.illustrations.lockCalendar.svg(),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title ?? "", style: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.danger),),
                        const Gap(3),
                        Text(widget.detail ?? "", style: MyStyle.text.mediumTextMedium14,),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      MyGesturePadding(
                        padding: const EdgeInsets.only(top: 15, left: 11, right: 15),
                        onTap: onClose,
                        child: MyAssets.icons.light.x.svg(),
                      ),
                    ],
                  )
                ],
              ),
            ),),
      ),
    );
  }

}
