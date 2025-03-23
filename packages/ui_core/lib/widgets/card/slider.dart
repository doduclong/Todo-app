// import 'package:carousel_slider/carousel_slider.dart' as carousel;
// import 'package:flutter/material.dart';
// import 'package:ui_core/src.dart';
//
// typedef BannerPageChanged = void Function(int index,);
//
// class MySlider extends StatefulWidget {
//
//   final List<Widget> banners;
//   final double height;
//   final double? width;
//   final bool autoPlay;
//   final bool pauseAutoPlayInFiniteScroll;
//   final BannerPageChanged? onPageChanged;
//   final int initIndex;
//   final List<BoxShadow>? boxShadow;
//   final EdgeInsetsGeometry margin;
//
//   const MySlider({super.key,
//     required this.banners,
//     this.height = 190,
//     this.width, this.autoPlay = true,
//      this.pauseAutoPlayInFiniteScroll = false, this.onPageChanged,
//     this.initIndex = 0, this.boxShadow,
//     this.margin = const EdgeInsets.symmetric(vertical: 30,),})
//       : assert (initIndex >= 0 && initIndex < banners.length);
//
//   @override
//   State<MySlider> createState() => _MySliderState();
// }
//
// class _MySliderState extends State<MySlider> {
//
//   final carousel.CarouselController controller = carousel.CarouselController();
//
//   int selectedIndex = 0;
//
//   void onPageChanged(int index, carousel.CarouselPageChangedReason reason){
//     setState(() {
//       selectedIndex = index;
//     });
//     widget.onPageChanged?.call(index,);
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     if(widget.initIndex != 0){
//       setState(() {
//         selectedIndex = widget.initIndex;
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: widget.margin,
//       height: widget.height,
//       decoration: BoxDecoration(
//         boxShadow: widget.boxShadow ?? [MyArtist.shadow.cardShadow()],
//       ),
//       width: MediaQuery.of(context).size.width,
//       child: Stack(
//         children: [
//           SizedBox(
//             height: widget.height,
//             width: MediaQuery.of(context).size.width,
//             child: carousel.CarouselSlider.builder(
//               carouselController: controller,
//               options: carousel.CarouselOptions(
//                 initialPage: widget.initIndex,
//                 autoPlayInterval: const Duration(seconds: 5),
//                 autoPlayAnimationDuration: const Duration(milliseconds: 1000),
//                 autoPlay: widget.autoPlay && widget.banners.length > 1,
//                 viewportFraction: 1,
//                 aspectRatio: 1,
//                 autoPlayCurve: Curves.ease,
//                 onPageChanged: onPageChanged,
//                 pauseAutoPlayInFiniteScroll: widget.pauseAutoPlayInFiniteScroll,
//
//               ),
//               itemCount: widget.banners.length,
//               itemBuilder: (context, index, realIdx) {
//                 return SizedBox(
//                   height: widget.height,
//                     width: widget.width ?? MediaQuery.of(context).size.width,
//                     child: widget.banners[index],);
//               },
//             ),
//           ),
//           if(widget.banners.length > 1)Positioned.fill(
//             bottom: 10,
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: widget.banners.asMap().entries.map((entry) {
//                   return GestureDetector(
//                     onTap: () => controller.animateToPage(entry.key),
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 200),
//                       width: selectedIndex == entry.key ? 8 : 4,
//                       height: 4,
//                       margin: const EdgeInsets.symmetric(horizontal: 2),
//                       decoration: BoxDecoration(
//                         color: selectedIndex == entry.key
//                             ? MyColor.white
//                             : MyColor.white.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
