import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo/feature/calendar/ui/calendar_ui.dart';
import 'package:todo/feature/todo/ui/todo_ui.dart';
import 'package:ui_core/src.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    final iconList = <IconData>[
      Icons.work_outline,
      Icons.calendar_month,
    ];

    return Scaffold(
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        activeColor: MyArtist.primaryColor,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 30,
        rightCornerRadius: 30,
        onTap: (index){
          this._onItemTapped(index);
        },
        //other params
      ),
    );
  }

  Widget getBody() {
    if(this._bottomNavIndex == 0) {
      return TodoPage();
    } else {
      return CalendarPage();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      this._bottomNavIndex = index;
    });
  }
}
