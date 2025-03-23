// // ignore_for_file: avoid_dynamic_calls
//
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:ui_core/src.dart';
// import 'package:extended_image/extended_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:validators/validators.dart';
//
// class MyImage extends StatefulWidget {
//   final dynamic image;
//   final double width;
//   final double height;
//   final double borderRadius;
//   final BoxFit? fit;
//   final BoxShape shape;
//   final Widget? loadingWidget;
//   final Widget? errorWidget;
//   final String forAssets; // For assets
//   final EdgeInsetsGeometry? margin;
//   final String? accessToken;
//
//   const MyImage({
//     super.key,
//     this.width = 60,
//     this.height = 60,
//     this.borderRadius = 12,
//     this.image,
//     this.fit,
//     this.shape = BoxShape.rectangle,
//     this.loadingWidget,
//     this.errorWidget,
//     this.forAssets = 'assets/',
//     this.margin,
//     this.accessToken,
//   });
//
//   @override
//   State<StatefulWidget> createState() => _MyImage();
// }
//
// class _MyImage extends State<MyImage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: widget.margin,
//       width: widget.width,
//       height: widget.height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(widget.borderRadius),
//       ),
//       child: () {
//         if (widget.image == null) {
//           return widget.errorWidget ?? ErrorWidget(widget: widget, shape: widget.shape,);
//         } else if (widget.image.runtimeType.toString() == "Uint8List"
//         || widget.image.runtimeType.toString() == "_Uint8ArrayView"
//         ) {
//           return ExtendedImage.memory(
//       widget.image as Uint8List,
//       fit: widget.fit,
//       width: widget.width,
//       height: widget.height,
//       shape: widget.shape,
//       borderRadius: BorderRadius.circular(widget.borderRadius),
//       loadStateChanged: (ExtendedImageState state) {
//         switch (state.extendedImageLoadState) {
//           case LoadState.loading:
//             return widget.loadingWidget ?? LoadingWidget(widget: widget,);
//           case LoadState.completed:
//             return null; // Để null nếu không muốn ghi đè 1 widget mới
//           case LoadState.failed:
//             return widget.errorWidget ?? ErrorWidget(widget: widget,shape: widget.shape,);
//         }
//       },
//     );
//     } else  {
//     if (isURL(widget.image as String)) {
//       return ExtendedImage.network(
//         widget.image as String,
//         headers: widget.accessToken == null ? null : {
//           'Content-type': 'application/json',
//           'Accept': 'application/json',
//           "Authorization" : widget.accessToken!,
//         },
//         fit: widget.fit,
//         width: widget.width,
//         height: widget.height,
//         shape: widget.shape,
//         borderRadius: BorderRadius.circular(widget.borderRadius),
//         loadStateChanged: (ExtendedImageState state) {
//           switch (state.extendedImageLoadState) {
//             case LoadState.loading:
//               return widget.loadingWidget ?? LoadingWidget(widget: widget,);
//             case LoadState.completed:
//               return null; // Để null nếu không muốn ghi đè 1 widget mới
//             case LoadState.failed:
//               return widget.errorWidget ?? ErrorWidget(widget: widget,shape: widget.shape,);
//           }
//         },
//       );
//     } else if ((widget.image as String).contains(widget.forAssets)) {
//       return ExtendedImage.asset(
//         widget.image as String,
//         fit: widget.fit,
//         width: widget.width,
//         height: widget.height,
//         shape: widget.shape,
//         borderRadius: BorderRadius.circular(widget.borderRadius),
//         loadStateChanged: (ExtendedImageState state) {
//           switch (state.extendedImageLoadState) {
//             case LoadState.loading:
//               return widget.loadingWidget ?? LoadingWidget(widget: widget,);
//             case LoadState.completed:
//               return null; // Để null nếu không muốn ghi đè 1 widget mới
//             case LoadState.failed:
//               return widget.errorWidget ?? ErrorWidget(widget: widget,shape: widget.shape,);
//           }
//         },
//       );
//     }
//     else {
//       return ExtendedImage.file(
//         File(widget.image as String),
//         fit: widget.fit,
//         width: widget.width,
//         height: widget.height,
//         shape: widget.shape,
//         borderRadius: BorderRadius.circular(widget.borderRadius),
//         loadStateChanged: (ExtendedImageState state) {
//           switch (state.extendedImageLoadState) {
//             case LoadState.loading:
//               return widget.loadingWidget ?? LoadingWidget(widget: widget,);
//             case LoadState.completed:
//               return null; // Để null nếu không muốn ghi đè 1 widget mới
//             case LoadState.failed:
//               return widget.errorWidget ?? ErrorWidget(widget: widget, shape: widget.shape,);
//           }
//         },
//       );
//     }
//     }
//     }(),
//       );
//   }
// }
//
// class ErrorWidget extends StatelessWidget {
//   const ErrorWidget({
//     super.key,
//     required this.widget,
//     this.shape = BoxShape.rectangle,
//   });
//
//   final BoxShape shape;
//   final MyImage widget;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: shape != BoxShape.circle ? BorderRadius.circular(widget.borderRadius) : null,
//         color: MyArtist.surface,
//         shape: shape,
//       ),
//       width: widget.width,
//       height: widget.height,
//       child: MyAssets.icons.bold.image.svg(
//           // width: widget.width>widget.height ? widget.height * 0.25:  widget.width * 0.25,
//           // height: widget.width>widget.height ? widget.height * 0.25:  widget.width * 0.25,
//           colorFilter: ColorFilter.mode(
//               MyArtist.onSurface3, BlendMode.srcIn,),),
//     );
//   }
// }
//
// class LoadingWidget extends StatelessWidget {
//   const LoadingWidget({
//     super.key,
//     required this.widget,
//   });
//
//   final MyImage widget;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MyShimmer(
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius:
//               BorderRadius.circular(widget.borderRadius),
//           // color: MyColors.surface,
//         ),
//         width: widget.width,
//         height: widget.height,
//         child: MyAssets.icons.bold.image.svg(
//          colorFilter: ColorFilter.mode(
//             MyArtist.onSurface3, BlendMode.srcIn,),),
//       ),
//     );
//   }
// }
