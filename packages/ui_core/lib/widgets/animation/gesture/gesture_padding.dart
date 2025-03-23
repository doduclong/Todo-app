import 'package:flutter/cupertino.dart';

class MyGesturePadding extends StatefulWidget{

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Function()? onTap;
  final bool isEnable;

  const MyGesturePadding({
    super.key,
    this.child,
    this.padding,
    this.onTap,
    this.isEnable = true,
  });

  @override
  State<StatefulWidget> createState() => _MyGesturePadding();

}

class _MyGesturePadding extends State<MyGesturePadding>{

  EdgeInsetsGeometry padding = EdgeInsets.zero;


  @override
  void initState() {
    padding = widget.padding ?? EdgeInsets.zero;
    super.initState();
  }

  void onChange(double time){
    setState(() {
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
          onChange(1.08);
        }
      },
      child: AnimatedPadding(
        padding: padding,
        duration: const Duration(milliseconds: 100),
        child: widget.child,
      ),
    );
  }
}
