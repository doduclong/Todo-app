import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:ui_core/src.dart';

class MyPopupMenuItem extends StatelessWidget{

  final Widget icon;
  final Function()? onTap;
  final String? text;
  final bool isSelected;

  const MyPopupMenuItem({super.key,
    required this.icon,
    this.onTap,
    this.text,
    this.isSelected = false,});

  @override
  Widget build(BuildContext context) {
    return MyGestureContainer(
      onTap: (){
        onTap?.call();
      },
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: isSelected ?  MyArtist.surface : null,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10,0, 10, 0),
            child: MyIconButton(
              color: MyArtist.noColor,
              size: 20,
              padding: 2,
              icon: icon,
            ),
          ),
          if(text != null )
            Expanded(child:
            Text(text ?? "",
              style: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface),
              overflow: TextOverflow.clip, maxLines: 1,),),
          if(text != null )const Gap(12),
        ],
      ),
    );
  }
}
