import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyEmptyPage extends StatefulWidget{

  final String? title;
  final String? detail;
  final double? height;
  final bool shrinkWrap;

  const MyEmptyPage({super.key,
    this.title,
    this.detail,
    this.height,  this.shrinkWrap = true,});

  @override
  State<MyEmptyPage> createState() => _MyEmptyPageState();
}

class _MyEmptyPageState extends State<MyEmptyPage> {

  final listRandom = [
    MyAssets.illustrations.error.astronaut,
    MyAssets.illustrations.error.cat,
    MyAssets.illustrations.error.coffee,
    MyAssets.illustrations.error.cow,
    MyAssets.illustrations.error.dogNewspaper,
    MyAssets.illustrations.error.dogSwimming,
    MyAssets.illustrations.error.errorDog,
    MyAssets.illustrations.error.errorNaughtyCat,
    MyAssets.illustrations.error.errorNaughtyDog,
    MyAssets.illustrations.error.errorRocketDestroyed,
    MyAssets.illustrations.error.errorServer,
    MyAssets.illustrations.error.puzzle,
  ];

  @override
  void initState() {
    super.initState();
    listRandom.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return  ListView(
      // key: MyKey.gKeyEmptyPage,
        physics: widget.shrinkWrap ? const BouncingScrollPhysics() : const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        shrinkWrap: widget.shrinkWrap,
        children: [SizedBox(
      height: widget.shrinkWrap ? widget.height ??  MediaQuery.of(context).size.height : null,
      child: MyColumn(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 49, vertical: 36,),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.37,
              width: MediaQuery.of(context).size.width * 0.74,
              child: Stack(
                children: [
                  Align(
                    child: MyArtist.colorFilter.colorFilterSvg( MyAssets.illustrations.background1, color: MyColor.blueLinear2.withOpacity(0.2)),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: listRandom.first.svg(
                      height: 250,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.73,
            child: MyColumn(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(widget.title != null ) Text(widget.title ?? "", style: MyStyle.text.titleH4Bold20,
                  textAlign: TextAlign.center,),
                if(widget.title != null || widget.detail != null) const Gap(5),
                if(widget.detail != null )Text(widget.detail ?? "",
                  style:  MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface),
                  textAlign: TextAlign.center,),
              ],
            ),
          ),
        ],
      ),
    )],);
  }
}
