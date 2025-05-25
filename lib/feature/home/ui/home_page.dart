import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/database/database.dart';
import 'package:todo/feature/calendar/ui/calendar_ui.dart';
import 'package:todo/feature/todo/bloc/todo_bloc.dart';
import 'package:todo/feature/todo/models/repeat_type.dart';
import 'package:todo/feature/todo/models/todo_model.dart';
import 'package:todo/feature/todo/ui/todo_ui.dart';
import 'package:ui_core/src.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
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
          MySubWidgets.bottomSheet.showMyBottomSheet(context: context, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Tên công việc"),
                MyTextField(
                  controller: TextEditingController(),
                ),

                Text("Nội dung công việc"),
                MyTextField(
                  controller: TextEditingController(),
                ),

                Text("Địa điểm thực hiện"),
                MyTextField(
                  controller: TextEditingController(),
                ),

                Text("Thời gian bắt đầu"),
                MyTextField(
                  controller: TextEditingController(),
                ),

                Text("Thời gian kết thúc"),
                MyTextField(
                  controller: TextEditingController(),
                ),

                Text("Nhãn"),
                MyDropdownSimple(),

                Text("Lặp lại"),
                MyDropdownSimple(
                  items: RepeatType.values.map((e) => e.displayName).toList(),
                  selectedItem: RepeatType.none.displayName,
                  onChanged: (value) {
                    print(value);
                  },
                ),

                ListTile(
                  title: Text('Add Todo'),
                  onTap: () {
                    picker.DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime(2100, 12, 12),
                        theme: picker.DatePickerTheme(
                            headerColor: Colors.orange,
                            backgroundColor: Colors.blue,
                            itemStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            doneStyle:
                            TextStyle(color: Colors.white, fontSize: 16)),
                        onChanged: (date) {
                          print('change $date in time zone ' +
                              date.timeZoneOffset.inHours.toString());
                        }, onConfirm: (date) {
                          print('confirm $date');
                        }, currentTime: DateTime.now(), locale: picker.LocaleType.vi);
                  },
                ),
              ],
            ),
          ));
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
      return BlocProvider(
        create: (context) => TodoBloc(DBProvider())..add(LoadTodos()),
        child: const TodoPage(),
      );;
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
