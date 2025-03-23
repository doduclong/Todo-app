import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyBanner2 extends StatelessWidget {

  final double padding;
  final String? title;
  final String? detail;
  final List<BoxShadow>? boxShadow;

  const MyBanner2({super.key,
    this.padding = 30, this.title, this.detail, this.boxShadow,});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: padding, ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: MyArtist.onBackground,
          boxShadow: boxShadow ?? [MyArtist.shadow.blueShadow()],
          gradient: MyArtist.gradient.blueLinear(),
      ),
      child:  //Add this CustomPaint widget to the Widget Tree
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Gap(20),
          Text(title ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: MyStyle.text.mediumTextMedium14.copyWith(color: MyColor.white),),
          const Gap(5),
          Text(detail ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MyStyle.text.mediumTextRegular14.copyWith(color: MyColor.white),),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
            ),
            height: 80,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 170), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: Card2Painter(),
            ),
          ),
          const Gap(3),
        ],
      ),);
  }
}

class Card2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final Path path1 = Path();
    path1.moveTo(size.width*-0.1649310,size.height*0.6794872);
    path1.cubicTo(size.width*-0.1180635,size.height*0.4875295,size.width*-0.002948653,size.height*0.3697385,size.width*0.1796241,size.height*0.3269231);
    path1.cubicTo(size.width*0.3859040,size.height*0.2785474,size.width*0.4817152,size.height*0.6483795,size.width*0.6748978,size.height*0.5576923);
    path1.cubicTo(size.width*0.8168700,size.height*0.4910449,size.width*0.7833963,size.height*0.3218359,size.width*0.8929133,size.height*0.2051282);
    path1.cubicTo(size.width*0.9848607,size.height*0.1071463,size.width*1.047471,size.height*0.05993179,size.width*1.164932,0);

    final Paint paint1Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=1.2;
    paint1Stroke.color= MyColor.white.withOpacity(0.3);
    canvas.drawPath(path1,paint1Stroke);

    final Path path2 = Path();
    path2.moveTo(size.width*-0.1649310,size.height*0.8333333);
    path2.cubicTo(size.width*-0.1180635,size.height*0.6413756,size.width*-0.002948650,size.height*0.5235846,size.width*0.1796241,size.height*0.4807692);
    path2.cubicTo(size.width*0.3859040,size.height*0.4323936,size.width*0.4817152,size.height*0.8022256,size.width*0.6748978,size.height*0.7115385);
    path2.cubicTo(size.width*0.8168700,size.height*0.6448910,size.width*0.7833963,size.height*0.4756821,size.width*0.8929133,size.height*0.3589744);
    path2.cubicTo(size.width*0.9848607,size.height*0.2609923,size.width*1.047471,size.height*0.2137782,size.width*1.164932,size.height*0.1538462);

    final Paint paint2Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=1.2;
    paint2Stroke.color= MyColor.white.withOpacity(0.3);
    canvas.drawPath(path2,paint2Stroke);

    final Path path3 = Path();
    path3.moveTo(size.width*-0.1649310,size.height*0.7820513);
    path3.cubicTo(size.width*-0.1180635,size.height*0.5900936,size.width*-0.002948653,size.height*0.4723026,size.width*0.1796241,size.height*0.4294872);
    path3.cubicTo(size.width*0.3859040,size.height*0.3811115,size.width*0.4817152,size.height*0.7509436,size.width*0.6748978,size.height*0.6602564);
    path3.cubicTo(size.width*0.8168700,size.height*0.5936090,size.width*0.7833963,size.height*0.4244000,size.width*0.8929133,size.height*0.3076923);
    path3.cubicTo(size.width*0.9848607,size.height*0.2097103,size.width*1.047471,size.height*0.1624962,size.width*1.164932,size.height*0.1025641);

    final Paint paint3Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=1.2;
    paint3Stroke.color= MyColor.white.withOpacity(0.3);
    canvas.drawPath(path3,paint3Stroke);

    final Path path4 = Path();
    path4.moveTo(size.width*-0.1649310,size.height*0.7307692);
    path4.cubicTo(size.width*-0.1180635,size.height*0.5388115,size.width*-0.002948653,size.height*0.4210205,size.width*0.1796241,size.height*0.3782051);
    path4.cubicTo(size.width*0.3859040,size.height*0.3298295,size.width*0.4817152,size.height*0.6996615,size.width*0.6748978,size.height*0.6089744);
    path4.cubicTo(size.width*0.8168700,size.height*0.5423269,size.width*0.7833963,size.height*0.3731179,size.width*0.8929133,size.height*0.2564103);
    path4.cubicTo(size.width*0.9848607,size.height*0.1584282,size.width*1.047471,size.height*0.1112138,size.width*1.164932,size.height*0.05128205);

    final Paint paint4Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=1;
    paint4Stroke.color= MyColor.white.withOpacity(0.3);
    canvas.drawPath(path4,paint4Stroke);

    final Path path5 = Path();
    path5.moveTo(size.width*-0.1649310,size.height*0.2435897);
    path5.cubicTo(size.width*0.01581344,size.height*0.4355474,size.width*0.1113406,size.height*0.5533385,size.width*0.2628471,size.height*0.5961538);
    path5.cubicTo(size.width*0.4340248,size.height*0.6445295,size.width*0.5135356,size.height*0.2746974,size.width*0.6738452,size.height*0.3653846);
    path5.cubicTo(size.width*0.7916594,size.height*0.4320321,size.width*0.7638824,size.height*0.6012410,size.width*0.8547647,size.height*0.7179487);
    path5.cubicTo(size.width*0.9310650,size.height*0.8159308,size.width*0.9830217,size.height*0.8631449,size.width*1.164932,size.height*0.9230769);

    final Paint paint5Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=1;
    paint5Stroke.color= MyColor.white;
    canvas.drawPath(path5,paint5Stroke);

    final Path path6 = Path();
    path6.moveTo(size.width*-0.1649310,size.height*0.08974359);
    path6.cubicTo(size.width*0.01581344,size.height*0.2817013,size.width*0.1113406,size.height*0.3994923,size.width*0.2628471,size.height*0.4423077);
    path6.cubicTo(size.width*0.4340248,size.height*0.4906833,size.width*0.5135356,size.height*0.1208513,size.width*0.6738452,size.height*0.2115385);
    path6.cubicTo(size.width*0.7916594,size.height*0.2781859,size.width*0.7638824,size.height*0.4473949,size.width*0.8547647,size.height*0.5641026);
    path6.cubicTo(size.width*0.9310650,size.height*0.6620846,size.width*0.9830217,size.height*0.7092987,size.width*1.164932,size.height*0.7692308);

    final Paint paint6Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=1;
    paint6Stroke.color= MyColor.white;
    canvas.drawPath(path6,paint6Stroke);

    final Path path7 = Path();
    path7.moveTo(size.width*-0.1649310,size.height*0.1410256);
    path7.cubicTo(size.width*0.01581344,size.height*0.3329833,size.width*0.1113406,size.height*0.4507744,size.width*0.2628471,size.height*0.4935897);
    path7.cubicTo(size.width*0.4340248,size.height*0.5419654,size.width*0.5135356,size.height*0.1721333,size.width*0.6738452,size.height*0.2628205);
    path7.cubicTo(size.width*0.7916594,size.height*0.3294679,size.width*0.7638824,size.height*0.4986769,size.width*0.8547647,size.height*0.6153846);
    path7.cubicTo(size.width*0.9310650,size.height*0.7133667,size.width*0.9830217,size.height*0.7605808,size.width*1.164932,size.height*0.8205128);

    final Paint paint7Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=1;
    paint7Stroke.color= MyColor.white;
    canvas.drawPath(path7,paint7Stroke);

    final Path path8 = Path();
    path8.moveTo(size.width*-0.1649310,size.height*0.1923077);
    path8.cubicTo(size.width*0.01581344,size.height*0.3842654,size.width*0.1113406,size.height*0.5020564,size.width*0.2628471,size.height*0.5448718);
    path8.cubicTo(size.width*0.4340248,size.height*0.5932474,size.width*0.5135356,size.height*0.2234154,size.width*0.6738452,size.height*0.3141026);
    path8.cubicTo(size.width*0.7916594,size.height*0.3807500,size.width*0.7638824,size.height*0.5499590,size.width*0.8547647,size.height*0.6666667);
    path8.cubicTo(size.width*0.9310650,size.height*0.7646487,size.width*0.9830217,size.height*0.8118628,size.width*1.164932,size.height*0.8717949);

    final Paint paint8Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=1;
    paint8Stroke.color= MyColor.white;
    canvas.drawPath(path8,paint8Stroke);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
