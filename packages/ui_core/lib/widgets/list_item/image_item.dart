// import 'package:flutter/cupertino.dart';
// import 'package:gap/gap.dart';
// import 'package:ui_core/src.dart';
//
// class MyImageItem extends StatelessWidget {
//   final String? tag; // For Hero
//   final dynamic image;
//   final String? accessToken;
//   final String? title;
//   final String? detail;
//   final List<Widget>? listDetail;
//   final Function()? onTap;
//   final Color? color;
//   final bool isSelected;
//   final EdgeInsetsGeometry margin;
//
//   const MyImageItem({
//     super.key,
//     this.image,
//     this.accessToken,
//     this.title,
//     this.detail,
//     this.onTap,
//     this.listDetail,
//     this.color,
//     this.isSelected = false,
//     this.margin = const EdgeInsets.symmetric(horizontal: 30), this.tag,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: margin,
//       // height: 60,
//       decoration: BoxDecoration(color: color ?? MyArtist.background,
//         borderRadius: BorderRadius.circular(12),
//         gradient: isSelected ? MyArtist.gradient.blueLinear(opacity: 0.2) : null,
//       ),
//       child: Row(
//         children: [
//           MyHero(
//             tag: tag,
//             child: MyImage(
//               accessToken: accessToken,
//               image: image,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const Gap(10),
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (title != null)
//                   Text(
//                     title ?? "",
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     style: MyStyle.text.mediumTextMedium14,
//                   ),
//                 if (title != null) const Gap(5),
//                 if (detail != null)
//                   Text(
//                     detail ?? "",
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 3,
//                     style: MyStyle.text.smallTextMedium12
//                         .copyWith(color: MyArtist.onSurface),
//                   ),
//                 if (listDetail !=  null)...?listDetail
//               ],
//             ),
//           ),
//           MyGestureContainer(
//             width: 24,
//             height: 60,
//             onTap: onTap,
//             child: MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.light.iconNext, color:  MyArtist.onSurface2),
//           ),
//         ],
//       ),
//     );
//   }
// }
