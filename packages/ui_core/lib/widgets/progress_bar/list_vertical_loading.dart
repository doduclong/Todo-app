
import 'package:ui_core/src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';

class MyListVerticalLoading extends StatelessWidget{

  final bool isLoading;
  final Widget child;
  final double margin;
  final double size;
  final int itemCount;
  final bool shrinkWrap;
  final double heightTitle; // Chiều cao của hàng tiêu đề
  final double heightDetail; // Chiều cao của hàng mô tả
  final int itemDetailCount; // Số lượng hàng mô tả.
  final double paddingStartAndEnd;

  const MyListVerticalLoading({
    super.key,
    this.isLoading = true,
    required this.child,
    this.margin = 30,
    this.size = 60,
    this.itemCount = 6,
    this.shrinkWrap = false,
    this.heightTitle = 14,
    this.heightDetail = 12,
    this.itemDetailCount = 1,
    this.paddingStartAndEnd = 0,
  });

  @override
  Widget build(BuildContext context) {
      return MyVisibility(
        visible: isLoading,
        replacement: child,
        child: MyListView(
          paddingStartAndEnd: paddingStartAndEnd,
          shrinkWrap: shrinkWrap,
          itemCount: itemCount,
          itemBuilder: (context, index) =>
              MyAnimatedLimiterItem(
                index: index,
                child:
                  Container(
                margin: EdgeInsets.symmetric(horizontal: margin),
                child: Row(
                  children: [
                    MyShimmer(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: MyArtist.background,
                        ),
                        width: size, height: size,
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyShimmer(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: MyArtist.background,
                              ),
                              width: (MediaQuery.of(context).size.width - margin*2 - size - 10)/2,
                              height: heightTitle,
                            ),
                          ),
                          const Gap(5),
                          ...List.generate(itemDetailCount, (index) => MyShimmer(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: MyArtist.background,
                              ),
                              width: MediaQuery.of(context).size.width - margin*2 - size - 10,
                              height: heightDetail,
                            ),
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),),
        ),
      );

  }
}
