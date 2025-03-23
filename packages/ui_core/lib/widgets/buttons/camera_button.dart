import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';

typedef FunctionCamera = void Function();

class MyCameraButton extends StatelessWidget {
  final FunctionCamera onCapture;
  final FunctionCamera? onTorch;
  final FunctionCamera? onFlip;
  final bool? isTorchEnable;
  final String? tag; // For Hero

  const MyCameraButton({super.key,
    required this.onCapture,
    this.onTorch,
    this.onFlip,
    this.isTorchEnable,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: 295,
    height: 68,
    child: Stack(
    children: [
    Align(
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: MyArtist.background.withOpacity(0.8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: MyGestureContainer(
              height: 24,
              width: 24,
              onTap: () {onTorch?.call();},
              margin: const EdgeInsets.only(top: 22, bottom: 22, left: 40),
              child: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.zapOff, color: isTorchEnable ?? false ? MyColor.blueLinear2: MyArtist.onSurface),
            ),
          ),
          Flexible(
            child: MyGestureContainer(
              height: 24,
              width: 24,
              margin: const EdgeInsets.only(top: 22, bottom: 22, right: 40),
              onTap: () {onFlip?.call();},
              child: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.flipCamera, color: MyArtist.onSurface),
            ),
          ),
        ],
      ),
    ),
    ),
    Align(
    child: MyHero(
      tag: tag,
      child: MyGestureContainer(
        onTap: (){
          onCapture.call();
        },
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            gradient: MyArtist.gradient.purpleLinear(),
        ),
        padding: const EdgeInsets.all(12),
        child: MyAssets.icons.light.camera.svg(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
