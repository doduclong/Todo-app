import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_core/src.dart';

typedef ChangeValue = void Function(String text);

class MyTextField extends StatefulWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool? obscureText;
  final double padding;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final ChangeValue? onChanged;
  final ChangeValue? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final bool readOnly;

  const MyTextField(
      {super.key,
        this.controller,
      this.prefixIcon,
      this.hintText,
      this.hintStyle,
      this.obscureText, // Ẩn hiện text
      this.padding = 15,
      this.keyboardType,
      this.style,
        this.onChanged,
        this.textInputAction,
        this.validator,
        this.autofocus = false,
        this.onFieldSubmitted,
        this.initialValue,
        this.inputFormatters,
        this.maxLines = 1,
        this.readOnly = false,});

  @override
  State<StatefulWidget> createState() => _MyOurInterpreterd();
}

class _MyOurInterpreterd extends State<MyTextField> {
  bool obscureText = false;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    setState(() {
      obscureText = widget.obscureText ?? false;
    });
  }


  @override
  void dispose() {
    if(widget.controller == null) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      inputFormatters: widget.inputFormatters,
      initialValue: widget.initialValue,
      autofocus: widget.autofocus,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
      style: widget.style ?? MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface),
      cursorWidth: 1.2,
      cursorColor: MyArtist.onSurface2, // màu con trỏ
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: obscureText,
      controller: widget.initialValue == null ? controller : null, // Không thể sử dụng cùng lúc initialValue và controller
      decoration: InputDecoration(
        errorStyle: MyStyle.text.captionRegular10.copyWith(color: MyArtist.danger),
        fillColor: MyArtist.surface,
        isDense: true,
        prefixIcon: (widget.prefixIcon != null)
            ? Padding(
                padding: EdgeInsets.only(
                    top: widget.padding,
                    left: widget.padding,
                    right: 10,
                    bottom: widget.padding,),
                child: MyArtist.colorFilter.colorFilterWidget(widget.prefixIcon!, color: MyArtist.onSurface),
              )
            : null,
        suffixIcon: (widget.obscureText != null)
            ? MyGesturePadding(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                padding: EdgeInsets.only(
                  top: widget.padding,
                  right: widget.padding,
                  left: 10,
                  bottom: widget.padding,
                ),
                child: MyAnimatedSwitcher(
                  child:  MyVisibility(
                    visible: obscureText,
                    replacement: MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.light.hidePassword, color: MyArtist.onSurface),
                    child: MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.light.showPassword, size: 18, color: MyArtist.onSurface),
                  ),
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            MyStyle.text.smallTextRegular12.copyWith(color: MyArtist.onSurface2),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: MyArtist.surface,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: MyArtist.surface,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: MyArtist.surface,
          ),
        ),
        filled: true,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: MyArtist.surface,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: MyArtist.surface,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: MyArtist.surface,
          ),
        ),
      ),
    );
  }
}
