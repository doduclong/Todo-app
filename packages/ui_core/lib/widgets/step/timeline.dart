import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:ui_core/src.dart';


class MyTimeline extends StatelessWidget {

  final double? height;
  final double? width;
  final List<Widget> children;
  final int processIndex;
  final bool isHorizontal;
  final bool showOppositeContents;
  final double margin;
  final bool shrinkWrap;

  const MyTimeline({super.key,
    this.height,
    this.width,
    this.children = const [],
    this.processIndex = 0,
    this.isHorizontal = true,
    this.showOppositeContents = true,
    this.margin = 0,
    this.shrinkWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      height: height,
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: isHorizontal ? Axis.horizontal : Axis.vertical,
          connectorTheme: const ConnectorThemeData(
            space: 30.0,
            thickness: 1,
          ),
        ),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: shrinkWrap,
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemExtentBuilder: (_, __) =>
          isHorizontal ? ((width  ?? MediaQuery.of(context).size.width) -  margin*2) / children.length : 89,
          oppositeContentsBuilder: (context, index) {
            return showOppositeContents ? Padding(
              padding: EdgeInsets.only(bottom: isHorizontal ? 13 : 0, right: isHorizontal ? 0 : 13),
              child: Column(
                children: [
                  Text('${(index + 1) < 10 ? 0 : ''}${index + 1}',
                  style: MyStyle.text.mediumTextRegular14.copyWith(
                      foreground: processIndex >  index
                          ? MyArtist.gradient.foregroundGradient(gradient: MyArtist.gradient.purpleLinear())
                          : null,
                      color:  processIndex >  index ? null : MyArtist.onSurface2,
                  ),),
                ],
              ),
            ) : null;
          },
          indicatorPositionBuilder: (context, index) => isHorizontal ? 0.5 : 0,
          nodePositionBuilder: (context, index) => showOppositeContents ? (isHorizontal ? 0.5 : 0.1) : 0,
          contentsBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: isHorizontal ? 15 : 0, left: isHorizontal ? 0 : 15),
              child: children[index] ,
            );
          },
          indicatorBuilder: (_, index) {
            return MyArtist.gradient.gradientWidget(Container(
              height: 20,
              width: 20,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: processIndex >  index ? MyColor.white : MyArtist.onSurface2, width: 1.2),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: processIndex >  index ? MyColor.white : MyArtist.onSurface2,
                ),
              ),
            ),
              linearGradient: processIndex >  index ?  MyArtist.gradient.purpleLinear() : null,
            );
          },

          connectorBuilder: (_, index, type) {
            if (index > 0) {
              return MyArtist.gradient.gradientWidget(DashedLineConnector(
                thickness: 1,
                dash: 6,
                gap: 4,
                color: processIndex >=  index ?  MyColor.white :  MyArtist.onSurface2 ,
              ),
                linearGradient: processIndex >=  index ?  MyArtist.gradient.purpleLinear() : null,
              );
            } else {
              return null;
            }
          },
          itemCount: children.length,
        ),
      ),
    );
  }
}
