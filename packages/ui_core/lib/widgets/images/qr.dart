import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ui_core/src.dart';

class MyQRCode extends StatefulWidget {

  final ImageProvider<Object>? embeddedImage;
  final String data;
  final double? size;

  const MyQRCode({super.key,
    this.embeddedImage,
    required this.data,
    this.size,
  });

  @override
  State<MyQRCode> createState() => _MyQRCodeState();
}

class _MyQRCodeState extends State<MyQRCode> {

  QrEyeShape eyeShape = QrEyeShape.circle;
  QrDataModuleShape dataModuleShape = QrDataModuleShape.circle;
  Gradient linearGradient = MyArtist.gradient.blueLinear();

  final listEyes = [QrEyeShape.circle, QrEyeShape.square];
  final listDataModule = [QrDataModuleShape.circle, QrDataModuleShape.square];
  final listLinearGradient = [MyArtist.gradient.blueLinear(), MyArtist.gradient.purpleLinear(), MyArtist.gradient.progressBarLinear()];

  void randomChange(){
    setState(() {
      eyeShape = (listEyes..shuffle()).first;
      dataModuleShape = (listDataModule..shuffle()).first;
      linearGradient = (listLinearGradient..shuffle()).first;
    });
  }


  @override
  void initState() {
    super.initState();
    randomChange();
  }

  @override
  Widget build(BuildContext context) {
    return MyArtist.gradient.gradientWidget(GestureDetector(
      onTap: randomChange,
      child: MyAnimatedSwitcher(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: QrImageView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            embeddedImage: widget.embeddedImage,
            eyeStyle:   QrEyeStyle(eyeShape: eyeShape, color: MyColor.white),
            dataModuleStyle  :  QrDataModuleStyle(dataModuleShape: dataModuleShape, color: MyColor.white),
            data: widget.data,
            size: widget.size,
          ),
        ),
      ),
    ),
        linearGradient: linearGradient,);
  }
}
