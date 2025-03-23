import 'package:flutter/cupertino.dart';
import 'package:ui_core/src.dart';

class MyGestureContainer extends StatefulWidget{

  final int duration;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final Function()? onTap;
  final double? height;
  final double? width;
  final bool isEnable;
  final  AlignmentGeometry? alignment;
  final Color color;
  final BoxConstraints? constraints;
  final Clip clipBehavior;

  const MyGestureContainer({
    super.key,
    this.child,
    this.margin,
    this.padding,
    this.decoration,
    this.onTap,
    this.height,
    this.width,
    this.isEnable = true,
    this.alignment, this.color = MyArtist.noColor,
    this.constraints,
    this.duration = 100,
    this.clipBehavior = Clip.none,
});

  @override
  State<StatefulWidget> createState() => _MyGestureContainer();

}

class _MyGestureContainer extends State<MyGestureContainer>{

  double? height;
  double? width;
  EdgeInsetsGeometry padding = EdgeInsets.zero;


  @override
  void initState() {
    height = widget.height;
    width = widget.width;
    padding = widget.padding ?? EdgeInsets.zero;
    super.initState();
  }

  void onChange(double time){
    setState(() {
    if(widget.width != null){
      width = widget.width! * time;
    }
    if(widget.height != null){
      height = widget.height! * time;
    }
    if(widget.padding != null){
      padding = widget.padding! * time;
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: () {
        if (widget.isEnable) {
          onChange(1);
        }
      },
      onTapUp: (_) {
        if (widget.isEnable) {
          onChange(1);
          widget.onTap?.call();
        }
      },
      onTapDown: (_) {
        if (widget.isEnable) {
          onChange(0.92);
        }
      },
      child: MyAnimatedContainer(
        clipBehavior: widget.clipBehavior,
        duration: widget.duration,
        constraints: widget.constraints,
        color: widget.color,
        alignment: widget.alignment,
        margin: widget.margin,
        width: width,
        height: height,
        padding: padding,
        decoration: widget.decoration,
        child: widget.child,
      ),
    );
  }
}
