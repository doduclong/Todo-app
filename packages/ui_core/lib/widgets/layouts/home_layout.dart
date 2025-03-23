
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:helper_package/src.dart';
import 'package:ui_core/src.dart';

// typedef SelectedIndexScreen = void Function(int index);

class MyHomeLayout extends StatefulWidget {
  final List<Widget> listScreen;
  final List<Widget> listIcon;
  final List<Widget> listIconActive;
  final Function()? onWillPop;
  final Function()? onResumed;
  final Function(int index)? onItemTapped;

  const MyHomeLayout({
    super.key,
    required this.listScreen,
    required this.listIcon,
    required this.listIconActive,
    this.onWillPop,
    this.onItemTapped,
    this.onResumed,
  })  : assert(
          listIconActive.length == listIcon.length,
          "listSelectedIcon, listIcon, listScreen phải có số lượng phần tử bằng nhau",
        ),
        assert(
          listScreen.length == listIcon.length,
          "listSelectedIcon, listIcon, listScreen phải có số lượng phần tử bằng nhau",
        );

  @override
  State<StatefulWidget> createState() => _MyTabLayout();
}

class _MyTabLayout extends State<MyHomeLayout> with WidgetsBindingObserver {

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        widget.onResumed?.call();
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
    }
  }

  // int selectedIndex = 0;
  MySwitchingController controllerSwitching = MySwitchingController();

  void _onItemTapped(int index) {
    widget.onItemTapped?.call(index);
    if(controllerSwitching.selectedIndex != index) {
      setState(() {
        controllerSwitching.onSelect(index);
      // controller.jumpToPage(selectedIndex);
    });
    }
  }

  @override
  void initState() {
    super.initState();
    controllerSwitching.addListener(() {
      // if(selectedIndex != controller.page!.round()) {
      // setState(() {
      //     selectedIndex = controller.page!.round();
      // });
      // }
      if (!_showBottomNavigationBar){
        setState(() {
          _showBottomNavigationBar = true;
        });
      }
      setState(() {});
    });
  }

  DateTime saveOffAppTime = DateTime.now();
  // PageController controller = PageController();
  double pixels = 0;
  bool _showBottomNavigationBar = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controllerSwitching.selectedIndex != 0) {
          _onItemTapped(0);
          return false;
        }
        if (DateTime.now().difference(saveOffAppTime).inSeconds > 2) {
          saveOffAppTime = DateTime.now();

          widget.onWillPop == null ?  MySubWidgets.dialog.showMySnackBar(
            context: context,
            message:  MyPackageInterpreter.oneMoreTimeToExit,
          ) : widget.onWillPop?.call();

          return false;
        }
        return true;
      },
      child: Scaffold(
          backgroundColor: MyArtist.background,
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            final isScrollHorizontal = scrollNotification.metrics.axisDirection == AxisDirection.right
                || scrollNotification.metrics.axisDirection == AxisDirection.left;

            if (scrollNotification is UserScrollNotification && !isScrollHorizontal) {
              if (scrollNotification.direction == ScrollDirection.forward && !_showBottomNavigationBar) {
                setState(() {
                  _showBottomNavigationBar = true;
                });
              } else if (scrollNotification.direction == ScrollDirection.reverse && _showBottomNavigationBar) {
                setState(() {
                  _showBottomNavigationBar = false;
                });
              }
            }
            return true;
          },
          child: MyPageView(
              controllerSwitching: controllerSwitching,
              children: widget.listScreen
            // children: widget.listScreen,
          ),
        ),
        bottomNavigationBar: MyAnimatedContainer(
          key: MyKey.gKeyHomeLayoutBottomNavigationBar,
          duration: 200,
          height: _showBottomNavigationBar ? 70 : 0,
          decoration: BoxDecoration(
            color: MyArtist.background,
            boxShadow: [MyArtist.shadow.cardShadow(color: MyArtist.cardShadow10)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [for (final icon in widget.listIcon) FittedBox(
              fit: BoxFit.fitHeight,
              child: MyGestureContainer(
                duration: 200,
                key: ValueKey<int>(widget.listIcon.indexOf(icon)),
                width: 64,
                onTap: () {
                  _onItemTapped(widget.listIcon.indexOf(icon));
                },
                decoration: BoxDecoration(
                  color: MyArtist.background,
                ),
                padding: const EdgeInsets.only(top: 23, left: 10, right: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: MyVisibility(
                        visible: widget.listIcon.indexOf(icon) == controllerSwitching.selectedIndex,
                        replacement: widget.listIcon[widget.listIcon.indexOf(icon)],
                        child: widget.listIconActive[widget.listIcon.indexOf(icon)],
                      ),
                    ),
                    MyAnimatedContainer(
                      margin: const EdgeInsets.only(top: 3),
                      width: widget.listIcon.indexOf(icon) == controllerSwitching.selectedIndex ? 4 : 0,
                      height: 4 ,
                      decoration: BoxDecoration(
                        gradient: widget.listIcon.indexOf(icon) == controllerSwitching.selectedIndex
                            ? MyArtist.gradient.purpleLinear()
                            : null,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),],
          ),
        ),
      ),
    );
  }
}


