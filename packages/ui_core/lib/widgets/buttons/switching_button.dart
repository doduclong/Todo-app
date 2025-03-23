import 'package:flutter/cupertino.dart';
import 'package:ui_core/src.dart';




class MySwitchingButton extends StatefulWidget {
  final List<dynamic> listText; // Chỉ xứ lý cho List<Widget> và List<String>
  final double margin;
  final int? selectedIndex;
  final  MySwitchingController? controller;
  // final Function(int index)? onChange;

  const MySwitchingButton({
    super.key,
    required this.listText,
    this.margin = 20,
    this.selectedIndex,
    // this.onChange,
    this.controller,
  });

  @override
  State<StatefulWidget> createState() => _MySwitchingButton();
}

class _MySwitchingButton extends State<MySwitchingButton> {

  late MySwitchingController controller;

  void onSelect(int index) {
    if(index != controller.selectedIndex){
      controller.onSelect(index);
      // widget.onChange?.call(index);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? MySwitchingController();
    controller.onSelect(widget.selectedIndex ?? 0);
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin),
      // height: 60,
      constraints: const BoxConstraints(minHeight: 60),
      decoration: BoxDecoration(
        color: MyArtist.surface,
        borderRadius: BorderRadius.circular(99),
      ),
      child: (){
        if(widget.listText.isEmpty) {
          return null;
        }

        try{
          final List<String> texts = List<String>.from(widget.listText);
          return MyRow(
            children: [
              for (final String e in texts)
                MyAnimatedSwitcher(
                  duration: 400,
                  child: MyGestureContainer(
                    onTap: () {
                      onSelect(texts.indexOf(e));
                    },
                    decoration: BoxDecoration(
                      gradient: texts.indexOf(e) == controller.selectedIndex
                          ? MyArtist.gradient.blueLinear()
                          : null,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    // height: texts.indexOf(e) == controller.selectedIndex ? 40 : null,
                    constraints: BoxConstraints(minHeight: texts.indexOf(e) == controller.selectedIndex ? 40 : 0,),
                    width: (MediaQuery.of(context).size.width - 20*4 - widget.margin * 2) / texts.length,
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    // padding: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(e, style: texts.indexOf(e) == controller.selectedIndex
                            ? MyStyle.text.textLargeMedium16.copyWith(color: MyArtist.onPrimary)
                            : MyStyle.text.textLargeRegular16.copyWith(color: MyArtist.onSurface2),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        }  catch (e){
          try {
            final List<Widget> widgets = List<Widget>.from(widget.listText);
            return MyRow(
              children: [
                for (final Widget e in widgets)
                  MyAnimatedSwitcher(
                    duration: 400,
                    child: MyGestureContainer(
                      onTap: () {
                        onSelect(widgets.indexOf(e));
                      },
                      decoration: BoxDecoration(
                        gradient: widgets.indexOf(e) == controller.selectedIndex
                            ? MyArtist.gradient.blueLinear()
                            : null,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      // height: widgets.indexOf(e) == controller.selectedIndex ? 40 : null,
                      constraints: BoxConstraints(minHeight: widgets.indexOf(e) == controller.selectedIndex ? 40 : 0,),
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width - 20 * 4 - widget.margin * 2) /
                          widgets.length,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10,),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      alignment: Alignment.center,
                      child: e,
                    ),
                  ),
              ],
            );
          } catch (e){
            return null;
          }
        }
      }(),
    );
  }


}
