import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';

class MyDropdownSimple extends FormField<String> {
  MyDropdownSimple(
      {super.key,
        String? hintText,
        String? selectedItem,
        List<String> items = const [],
        Function(String? value)? onChanged,
        Widget? prefixIcon,
        EdgeInsetsGeometry margin = EdgeInsets.zero,
        super.onSaved,
        super.validator,
      })
      : super(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    initialValue: selectedItem,
    builder: (FormFieldState<String> state) {
      return _MyDropdownSimple(
        hintText: hintText,
        selectedItem: selectedItem,
        items: items,
        onChanged: onChanged,
        prefixIcon: prefixIcon,
        margin: margin,
        state: state,);
    },);
}

class _MyDropdownSimple extends StatefulWidget {
  final String? hintText;
  final String? selectedItem;
  final List<String> items;
  final Function(String? value)? onChanged;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry margin;
  final FormFieldState<String> state;

  const _MyDropdownSimple({super.key,
    this.hintText,
    this.selectedItem,
    this.items = const [],
    this.onChanged, this.prefixIcon,
    this.margin = EdgeInsets.zero,
    required this.state,});

  @override
  State<_MyDropdownSimple> createState() => _MyDropdownSimpleState();
}

class _MyDropdownSimpleState extends State<_MyDropdownSimple> {

  final myKey = GlobalKey<DropdownSearchState<String>>();

  @override
  Widget build(BuildContext context) {
    return  MyAnimatedContainer(
      padding: widget.margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownSearch<String>(
            key: myKey,
            dropdownButtonProps : DropdownButtonProps(
              padding: const EdgeInsets.all(15),
              iconSize: 10.5,
              splashRadius: 1,
              splashColor: MyArtist.noColor,
              focusColor: MyArtist.noColor,
              hoverColor: MyArtist.noColor,
              disabledColor: MyArtist.noColor,
              icon:  MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.light.arrowDown,  color: MyArtist.onSurface,),
            ),
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              interceptCallBacks: true, //important line
              itemBuilder: (ctx, item, isSelected) {
                return  MyGestureContainer(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: isSelected ? MyArtist.gradient.blueLinear(opacity: 0.2) : null,
                    ),
                    onTap: (){
                      myKey.currentState?.popupValidate([item]);
                    },
                    padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 15,),
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text(item, style: MyStyle.text.smallTextRegular12,),);
              },

              containerBuilder: (ctx, popupWidget) {
                return Padding(
                  padding: const EdgeInsets.symmetric( vertical: 10),
                  child: MyColumn(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          child: popupWidget,),
                    ],
                  ),
                );
              },
              menuProps :  MenuProps(
                borderRadius: BorderRadius.circular(12),
                backgroundColor : MyArtist.background,
                shadowColor: MyArtist.cardShadow7,

              ),
              fit: FlexFit.loose,
            ),
            selectedItem: widget.selectedItem,
            items:  widget.items,
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface),
              dropdownSearchDecoration: InputDecoration(
                prefixIcon:  Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 10,
                    bottom: 15,),
                  child:  MyArtist.colorFilter.colorFilterWidget(widget.prefixIcon ?? MyAssets.icons.light.game.svg(),  color: MyArtist.onSurface,),
                ),
                errorStyle: MyStyle.text.captionRegular10.copyWith(color: MyArtist.danger),
                fillColor: MyArtist.surface,
                isDense: true,
                hintText: widget.hintText,
                hintStyle: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface2),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:  BorderSide(
                    color: MyArtist.surface,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:  BorderSide(
                    color: MyArtist.surface,
                  ),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:  BorderSide(
                    color: MyArtist.surface,
                  ),
                ),
                filled: true,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:  BorderSide(
                    color: MyArtist.surface,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:  BorderSide(
                    color: MyArtist.surface,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:  BorderSide(
                    color: MyArtist.surface,
                  ),
                ),
              ),
            ),
            onChanged: widget.onChanged,
          ),
          if(widget.state.hasError) Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            alignment: Alignment.centerLeft,
            child: Text(widget.state.errorText ?? "", style: MyStyle.text.captionRegular10.copyWith(color: MyArtist.danger), ),),
        ],
      ),
    );
  }
}
