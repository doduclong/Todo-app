import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_core/src.dart';

class MyPopupMenu extends StatefulWidget{

  final List<Widget> children;

  const MyPopupMenu({super.key,  this.children = const <Widget>[]});

  @override
  State<StatefulWidget> createState() => _MyPopupMenu();

}


class _MyPopupMenu extends State<MyPopupMenu>{

  final CustomPopupMenuController _controller = CustomPopupMenuController();

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      barrierColor: MyArtist.onBackground.withOpacity(0.05),
      arrowColor: MyArtist.background.withOpacity(0.92),
      menuBuilder: () => ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: 150,
          decoration: BoxDecoration(
              color: MyArtist.background.withOpacity(0.92),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: MyArtist.surface,),
              boxShadow: [MyArtist.shadow.cardShadow()]
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children,
          ),
        ),
      ),
      pressType: PressType.singleClick,
      verticalMargin: -10,
      controller: _controller,
      child:   MyIconButton(
        onTap: (){
          _controller.showMenu();
        },
        size: 22,
        padding: 4,
          icon: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.twoDot, color: MyArtist.onSurface,),
      ),
    );
  }
}