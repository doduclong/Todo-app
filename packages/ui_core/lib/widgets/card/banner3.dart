import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyBanner3 extends StatelessWidget {

  final Widget image;
  final String? title;
  final String? subTitle;
  final String? textButton;
  final Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final String? tag; // For Hero


  const MyBanner3({super.key,
    required this.image,
    this.title,
    this.subTitle,
    this.textButton,
    this.onTap,
    this.margin,
    this.tag,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
    constraints: const BoxConstraints(
      maxWidth: 400,
    ),
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          gradient: MyArtist.gradient.blueLinear(),
          borderRadius: BorderRadius.circular(22),
      ),
      height: 176,
      child:
      Padding(
        padding: const EdgeInsets.only(top: 12),
        child: CustomPaint(
          painter: Card3Painter(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 26),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(title ?? "",
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          style: MyStyle.text.mediumTextSemiBold14.copyWith(color: MyColor.white),),
                      ),
                      if(subTitle != null)const Gap(5),
                      if(subTitle != null)Text(subTitle ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: MyStyle.text.smallTextRegular12.copyWith(color: MyColor.white),),
                      const Spacer(),
                      SizedBox(
                          width: 95,
                          child: Center(
                            child: MyGestureContainer(
                              onTap: onTap,
                                width: 95,
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    gradient: MyArtist.gradient.purpleLinear(),
                                    borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(textButton ?? "", style: MyStyle.text.captionBold10.copyWith(color: MyColor.white),),),
                          ),),
                    ],
                  ),
                ),
              ),
              MyHero(
                tag: tag,
                child: Container(
                    padding: const EdgeInsets.fromLTRB(7, 8, 0, 20),
                    alignment: Alignment.center,

                    child: Container(
                        height: 115,
                        width: 115,
                        margin: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: MyArtist.background,
                            boxShadow: [MyArtist.shadow.cardShadow()],
                        ),
                        child: image,),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Card3Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(0.2);
    canvas.drawCircle(Offset(size.width*0.9273256,size.height*0.7302632),size.width*0.11267442,paint0Fill);

    final Paint paint1Fill = Paint()..style=PaintingStyle.fill;
    paint1Fill.color = Colors.white.withOpacity(0.2);
    canvas.drawCircle(Offset(size.width*0.00367442,size.height*0.9355263),size.width*0.16267442,paint1Fill);

    final Paint paint2Fill = Paint()..style=PaintingStyle.fill;
    paint2Fill.color = Colors.white.withOpacity(0.2);
    canvas.drawCircle(Offset(size.width*0.5523256,size.height*0.09210526),size.width*0.02162791,paint2Fill);

    final Paint paint3Fill = Paint()..style=PaintingStyle.fill;
    paint3Fill.color = Colors.white.withOpacity(0.2);
    canvas.drawCircle(Offset(size.width*0.4505814,size.height*0.6447368),size.width*0.02162791,paint3Fill);

    final Paint paint4Fill = Paint()..style=PaintingStyle.fill;
    paint4Fill.color = Colors.white.withOpacity(0.2);
    canvas.drawCircle(Offset(size.width*0.3837209,size.height*0.02631579),size.width*0.02162791,paint4Fill);

    final Paint paint5Fill = Paint()..style=PaintingStyle.fill;
    paint5Fill.color = Colors.white.withOpacity(0.2);
    canvas.drawCircle(Offset(size.width*0.5755814,size.height*0.7828947),size.width*0.02162791,paint5Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

