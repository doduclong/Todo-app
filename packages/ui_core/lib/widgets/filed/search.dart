
import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';

class MySearch extends StatefulWidget{
  /// Container
  final double margin;
  /// TextField
  final TextStyle? style;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? hintText;
  final double padding;
  final Widget? prefixIcon;
  final ChangeValue? onChanged;
  final ChangeValue? onFieldSubmitted;
  final bool isGrayColor;
  final bool autofocus;
  /// Filter
  final Function()? onFilter;
  final bool cleanAll;

  const MySearch({
    super.key,
    this.style,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.hintText,
    this.padding = 15,
    this.prefixIcon,
    this.onChanged,
    this.onFilter,
    this.margin = 20,
    this.onFieldSubmitted,
    this.isGrayColor = false,
    this.autofocus = false,
    this.cleanAll = true,
  });

  @override
  State<StatefulWidget> createState() => _MySearch();

}

class _MySearch extends State<MySearch> with SingleTickerProviderStateMixin{
  late TextEditingController textEditingController;
  bool cleanAll = false;

  @override
  void initState() {
    super.initState();
    textEditingController = widget.controller ?? TextEditingController();
    textEditingController.addListener(() {
      if(textEditingController.text.isEmpty && cleanAll){
        setState(() {
          cleanAll = false;
        });
      } else if (textEditingController.text.isNotEmpty && !cleanAll){
        setState(() {
          cleanAll = true;
        });
      }
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin),
      height: 50,
      decoration: BoxDecoration(
        color: widget.isGrayColor ? MyArtist.surface : MyArtist.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: widget.isGrayColor ? null :[MyArtist.shadow.cardShadow()],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              autofocus: widget.autofocus,
              onFieldSubmitted: widget.onFieldSubmitted,
              onChanged: widget.onChanged,
              style: widget.style ?? MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface2),
              cursorWidth: 1.2,
              cursorColor: MyArtist.onSurface2, // màu con trỏ
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction ?? TextInputAction.search,
              controller: textEditingController,
              decoration: InputDecoration(
                errorStyle: MyStyle.text.captionRegular10.copyWith(color: MyArtist.danger),
                fillColor: widget.isGrayColor ? MyArtist.surface : MyArtist.background,
                isDense: true,
                prefixIcon:  MyVisibility(
                  visible: widget.prefixIcon != null,
                  replacement: Padding(
                    padding: EdgeInsets.only(
                      top: widget.padding,
                      left: widget.padding,
                      right: 10,
                      bottom: widget.padding,),
                    child: MyAssets.icons.light.search.svg(
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(MyArtist.onSurface2, BlendMode.srcIn),
                    ),
                  ),
                  child: Padding(
                  padding: EdgeInsets.only(
                      top: widget.padding,
                      left: widget.padding,
                      right: 10,
                      bottom: widget.padding,),
                  child: widget.prefixIcon,
                ),
                    ),
                suffixIcon: cleanAll
                    ? MyGesturePadding(
                  onTap: () {
                      textEditingController.clear();
                      widget.onChanged?.call(textEditingController.text);
                      widget.onFieldSubmitted?.call(textEditingController.text);
                  },
                  padding: EdgeInsets.only(
                    top: widget.padding,
                    right: widget.padding,
                    left:  10 ,
                    bottom: widget.padding,
                  ),
                  child: SizedBox(height: 18, child: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.x, color: MyArtist.onSurface2)),
                ) : null,
                hintText: widget.hintText,
                hintStyle: MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface3),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: widget.isGrayColor ? MyArtist.surface : MyArtist.background,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: widget.isGrayColor ? MyArtist.surface : MyArtist.background,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: widget.isGrayColor ? MyArtist.surface : MyArtist.background,
                  ),
                ),
                filled: true,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: widget.isGrayColor ? MyArtist.surface : MyArtist.background,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: widget.isGrayColor ? MyArtist.surface : MyArtist.background,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: widget.isGrayColor ? MyArtist.surface : MyArtist.background,
                  ),
                ),
              ),
            ),
          ),
         if(widget.onFilter != null ) const MyDivider(isVertical: true, indent: 15, heightOrWidth: 0,),
          if(widget.onFilter != null ) MyGestureContainer(
            onTap:  widget.onFilter,
            padding: const EdgeInsets.only(top: 15, right: 15, bottom: 15, left: 10),
            child: widget.isGrayColor
                ? MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.light.filterSearch, color: MyArtist.onSurface2 )
                : MyAssets.icons.light.filterSearch.svg(),
          ),
        ],
      ),
    );
  }

}
