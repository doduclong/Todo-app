import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:helper_package/src.dart';
import 'package:ui_core/src.dart';

class MyDateCard extends StatelessWidget{

  final DateTime? dateTime;
  final bool isGood;
  final String? title;
  final String? detail;
  final List<Widget>? listDetail;
  final Function()? onTap;
  final String messageTooltip;

  const MyDateCard({super.key,
    this.isGood = false,
    this.title,
    this.detail,
    this.listDetail,
    this.onTap,
    this.dateTime,
    this.messageTooltip = '',});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyArtist.background2,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            if(MyArtist.isBrightnessLight) MyArtist.shadow.cardShadow(),
          ],),
      child: Row(
        children: [
          MyFavorite(
            message: messageTooltip,
            isFavorite: isGood,
            time: 0.6,
            child: Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  minWidth: 100,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: MyArtist.surface,
                  border: Border.all(
                    color: MyArtist.onSurface.withOpacity(0.1),
                    width: 1.2,
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(MyHelper.dateTime.d(dateTime), style: MyStyle.text.titleH2SemiBold24,),
                    Text(MyHelper.dateTime.mMMM(dateTime,), style: MyStyle.text.mediumTextRegular14.copyWith(color: MyArtist.onSurface),),
                    const MyDivider( thickness: 0.5, indent: 16, heightOrWidth: 6,),
                    Text(MyHelper.dateTime.eEEE(dateTime,), style: MyStyle.text.mediumTextSemiBold14,),
                  ],
                ),
            ),
          ),
          const Gap(15),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(title ?? "",
                        style: MyStyle.text.mediumTextMedium14,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const Gap(3),
                Text( detail ?? "",
                  style:  MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
               if(listDetail != null)...?listDetail,
              ],
            ),
          ),
          const Gap(10),
          MyGestureContainer(
            onTap: onTap,
            height: 100,
            // padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    decoration: BoxDecoration(
                      boxShadow: [if(!isGood)MyArtist.shadow.dropShadow()],
                      color: MyArtist.background2,
                      borderRadius: BorderRadius.circular(99),
                      border: Border.all(color: MyColor.purpleLinear1, width: 0.8),
                    ),
                    width:24,
                    height: 24,
                    padding: const EdgeInsets.all(5),
                    child: MyArtist.gradient.purpleLinearIconSVG( MyAssets.icons.light.arrowRight2),),
                const Gap(15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
