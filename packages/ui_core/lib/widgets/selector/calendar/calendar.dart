import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:helper_package/src.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ui_core/src.dart';

typedef DaySelectedFunction = void Function(
    DateTime selectedDay, // Trả về ngày chọn
    DateTime focusedDay, // Trả về tháng đang hiển thị.
    Set<DateTime> selectedDays,  // Trả về danh sách các ngày đang được chọn
    );

typedef RangeSelectedFunction = void Function(
    DateTime? start,
    DateTime? end,
    DateTime focusedDay, // Trả về tháng đang hiển thị.
    DateTimeRange? selectedRange,
    );
typedef PageChangedFunction = void Function( DateTime focusedDay);


class MyCalendar extends StatefulWidget{

  final DaySelectedFunction? onDaySelected;
  final RangeSelectedFunction? onRangeSelected;
  final DateTime? rangeStart;
  final DateTime? rangeEnd;
  final DateTime? selectedDay;
  final PageChangedFunction? onPageChanged;
  final List<dynamic> Function(DateTime)? eventLoader;
  final bool isMultiSelect;  // Chọn nhều.
  final bool isCalendarFormat;  // Chọn khoảng thời gian.
  final String? tag; // For Hero

  const MyCalendar({super.key,
    this.onDaySelected,
    this.onPageChanged,
    this.eventLoader,
    this.isMultiSelect = false,
    this.isCalendarFormat = false,
    this.onRangeSelected,
    this.rangeStart,
    this.rangeEnd,
    this.selectedDay,
    this.tag,
  });

  @override
  State<StatefulWidget> createState() => _MyCalendar();

}

class _MyCalendar extends State<MyCalendar>{

  late PageController _pageController;

  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());

  DateTime? _selectedDay;


  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: (DateTime key) {
      return key.day * 1000000 + key.month * 10000 + key.year;
    },
  );

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  void  _onRangeSelected(DateTime? start, DateTime? end,DateTime focusedDay){
    setState(() {
      _selectedDay = null;
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
    widget.onRangeSelected?.call(start,end, focusedDay, (start != null && end != null) ? DateTimeRange(start: start, end: end) : null);
  }

  @override
  void initState() {
    super.initState();
    if(widget.onRangeSelected != null){
      setState(() {
        _rangeSelectionMode = RangeSelectionMode.toggledOn;
        _rangeStart = widget.rangeStart;
        _rangeEnd = widget.rangeEnd;
        if(_rangeStart != null) _focusedDay.value = _rangeStart!;
      });
    }
    if(widget.selectedDay != null){
      _selectedDay = widget.selectedDay;
      if(_selectedDay != null) _focusedDay.value = _selectedDay!;
    }
    // _selectedDay = _focusedDay.value;
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (widget.isMultiSelect) {
      setState(() {
        _focusedDay.value = focusedDay;
        // Update values in a Set
        if (_selectedDays.contains(selectedDay)) {
          _selectedDays.remove(selectedDay);
        } else {
          _selectedDays.add(selectedDay);
        }
      });
    } else {
      if (!isSameDay(_selectedDay, selectedDay)) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay.value = focusedDay;
        });
      }
    }
    widget.onDaySelected?.call(selectedDay,focusedDay, _selectedDays);
  }

  void _onPageChanged(DateTime focusedDay) {
      setState(() {
            _focusedDay.value = focusedDay;
          });
      widget.onPageChanged?.call(focusedDay);
  }

  bool _selectedDayPredicate(DateTime day){
    if(widget.isMultiSelect) {
      return _selectedDays.contains(day);
    } else {
      return isSameDay(_selectedDay, day);
    }
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;

  void  _onFormatChanged(CalendarFormat format){
    if (_calendarFormat != format && widget.isCalendarFormat) {
      // Call `setState()` when updating calendar format
      setState(() {
        _calendarFormat = format;
      });
    }
  }

  bool isSelectYear = false;

  ScrollController controller = ScrollController();
  final List<int> years = MyHelper.dateTime.listYear(
    firstDay: MyHelper.dateTime.maxYearAgo(),
    lastDay: MyHelper.dateTime.maxYearNext(),
  );

  @override
  Widget build(BuildContext context) {
    return MyHero(
      tag: widget.tag,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           MyAnimatedSwitcher(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Stack(
                children: [Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(!isSelectYear)MyIconButton(
                        size: 15,
                        onTap: (){
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                          );

                        },
                        padding: 0,
                        color: MyArtist.background,
                        icon: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.arrowLeft, color: MyArtist.onSurface2,),),
                    if(!isSelectYear) const Gap(30),
                    ValueListenableBuilder<DateTime>(
                      valueListenable: _focusedDay,
                      builder: (context, value, _) {
                        return Text(
                          MyHelper.dateTime.yMMM(_focusedDay.value,),
                          style: MyStyle.text.mediumTextRegular14.copyWith(
                            color: MyArtist.onSurface2,
                          ),);},
                    ),
                    const Gap(5),
                    MyIconButton(
                      size: 15,
                      onTap: (){
                        setState(() {
                          isSelectYear = !isSelectYear;
                        });
                        if(isSelectYear){
                          Future.delayed(const Duration(milliseconds: 200), () {
                            try {
                              controller.jumpTo(
                                controller.position.maxScrollExtent / (years.length/3).ceil()
                                    * (years.indexOf(_focusedDay.value.year) > years.length/2
                                    ? (years.indexOf(_focusedDay.value.year)/3).ceil() + (years.indexOf(_focusedDay.value.year)%3 == 0 ? 1 : 0)
                                    : (years.indexOf(_focusedDay.value.year)/3).floor()),
                              );
                            } catch (e) {}});
                        }
                      },
                      padding: 0,
                      color: MyArtist.noColor,
                      icon: MyArtist.colorFilter.colorFilterSvg(
                           isSelectYear ? MyAssets.icons.light.arrowUp : MyAssets.icons.light.arrowDown,
                          color: MyArtist.onSurface2, ),),
                    if(!isSelectYear) const Gap(30),
                    if(!isSelectYear) MyIconButton(
                        size: 15,
                        onTap: (){
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                          );
                        },
                        padding: 0,
                        color: MyArtist.background,
                        icon: MyAssets.icons.light.arrowRight2.svg(colorFilter: MyArtist.colorFilter.srcIn(color: MyArtist.onSurface2)),),
                  ],
                ),
                  if(!isSelectYear) Positioned(
                    right: 0,
                    child: MyPopupMenu(
                      children: [
                        MyPopupMenuItem(
                          onTap: (){
                            setState(() {
                              _focusedDay.value = DateTime.now();
                            });
                          },
                          text:  MyPackageInterpreter.reset,
                          icon: MyAssets.icons.light.refresh.svg(colorFilter: MyArtist.colorFilter.srcIn(color: MyArtist.onSurface)),
                        ),
                        if(widget.isCalendarFormat)MyPopupMenuItem(
                          onTap: (){
                            if(_calendarFormat == CalendarFormat.month){
                              _onFormatChanged(CalendarFormat.twoWeeks);
                            } else if (_calendarFormat == CalendarFormat.twoWeeks){
                              _onFormatChanged(CalendarFormat.week);
                            } else {
                              _onFormatChanged(CalendarFormat.month);
                            }
                          },
                          text: _calendarFormat == CalendarFormat.month ?  MyPackageInterpreter.twoWeeks : _calendarFormat == CalendarFormat.twoWeeks ?  MyPackageInterpreter.week :  MyPackageInterpreter.month,
                          icon: MyAssets.icons.light.calendar.svg(colorFilter: MyArtist.colorFilter.srcIn(color: MyArtist.onSurface)),
                        ),
                        if(widget.isMultiSelect)MyPopupMenuItem(
                          onTap: (){
                            setState(() {
                              _selectedDays.clear();
                              widget.onDaySelected?.call(_selectedDay ?? _focusedDay.value, _focusedDay.value, _selectedDays);
                            });
                          },
                          text: MyPackageInterpreter.clean,
                          icon: MyAssets.icons.light.delete.svg(colorFilter: MyArtist.colorFilter.srcIn(color: MyArtist.onSurface)),
                        ),
                      ],
                    ),

                  )
                ],
              ),
            ),
          ),
           MyVisibility(
            visible: isSelectYear,
            replacement: TableCalendar(
              headerVisible: false,
              firstDay: MyHelper.dateTime.maxYearAgo(),
              lastDay: MyHelper.dateTime.maxYearNext(),
              focusedDay: _focusedDay.value,
              selectedDayPredicate: _selectedDayPredicate,
              onDaySelected: _onDaySelected,
              onCalendarCreated: (controller) => _pageController = controller,
              rangeSelectionMode: _rangeSelectionMode,
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              onRangeSelected: _onRangeSelected,
              calendarFormat: _calendarFormat,
              onFormatChanged: _onFormatChanged,
              onPageChanged: _onPageChanged,
              eventLoader: widget.eventLoader,
              calendarBuilders: const CalendarBuilders(),
              locale: MyPackageInterpreter.defaultLocale,
              pageAnimationDuration : const Duration(milliseconds: 200),
              formatAnimationDuration:  const Duration(milliseconds: 100),
              headerStyle: HeaderStyle(
                headerPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width/2 - 243/2,
                  vertical: 15,),
                leftChevronIcon: MyAssets.icons.light.arrowLeft.svg(),
                rightChevronIcon: MyAssets.icons.light.arrowRight2.svg(height: 15, colorFilter: MyArtist.colorFilter.srcIn(color: MyArtist.onSurface2)),
                titleTextStyle: MyStyle.text.mediumTextRegular14.copyWith(
                  color: MyArtist.onSurface2,
                ),
                leftChevronPadding : const EdgeInsets.all(3.5),
                rightChevronPadding : const EdgeInsets.all(3.5),
                leftChevronMargin :  EdgeInsets.zero,
                rightChevronMargin :  EdgeInsets.zero,
                formatButtonVisible: false,
                titleCentered: true,),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: MyStyle.text.myTextStyleForHero(textStyle: MyStyle.text.captionBold10.copyWith(color: MyArtist.onSurface2), context: context) ,
                weekendStyle: MyStyle.text.myTextStyleForHero(textStyle: MyStyle.text.captionBold10.copyWith(color: MyArtist.onSurface2), context: context),
              ),
              daysOfWeekHeight: 22,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle:  CalendarStyle(
                markersAutoAligned: false,
                markerMargin: const EdgeInsets.symmetric(horizontal: 1, vertical: 7),
                markerSize: 4,
                markerDecoration :  BoxDecoration(
                  gradient: MyArtist.gradient.purpleLinear(),
                  shape: BoxShape.circle,
                ),
                tablePadding : const EdgeInsets.symmetric(horizontal: 30),
                defaultTextStyle: MyStyle.text.myTextStyleForHero(context: context, textStyle: MyStyle.text.mediumTextMedium14.copyWith(color: MyArtist.onSurface), ),
                weekendTextStyle: MyStyle.text.myTextStyleForHero(context: context, textStyle: MyStyle.text.mediumTextMedium14.copyWith(color: MyArtist.onSurface), ),
                outsideTextStyle: MyStyle.text.myTextStyleForHero(context: context, textStyle: MyStyle.text.mediumTextMedium14.copyWith(color: MyArtist.onSurface3), ),
                selectedTextStyle: MyStyle.text.myTextStyleForHero(context: context, textStyle: MyStyle.text.mediumTextMedium14.copyWith(color: MyArtist.background), ),
                todayTextStyle: MyStyle.text.myTextStyleForHero(context: context, textStyle: MyStyle.text.mediumTextMedium14.copyWith(color: MyArtist.onSurface), ),
                withinRangeTextStyle: MyStyle.text.myTextStyleForHero(context: context, textStyle: MyStyle.text.mediumTextMedium14.copyWith(color: MyArtist.onSurface), ),
                withinRangeDecoration: BoxDecoration(  borderRadius: BorderRadius.circular(10),),
                rangeHighlightColor: MyColor.purpleLinear1.withOpacity(0.2),
                rangeStartTextStyle : MyStyle.text.myTextStyleForHero(context: context, textStyle: MyStyle.text.mediumTextMedium14.copyWith(color: MyArtist.background), ),
                rangeStartDecoration:  BoxDecoration(
                  gradient: MyArtist.gradient.purpleLinear(),
                  borderRadius: BorderRadius.circular(10),
                ),    rangeEndTextStyle : MyStyle.text.myTextStyleForHero(context: context, textStyle: MyStyle.text.mediumTextMedium14.copyWith(color: MyArtist.background), ),
                rangeEndDecoration : BoxDecoration(
                  gradient: MyArtist.gradient.purpleLinear(),
                  borderRadius: BorderRadius.circular(10),
                ),
                selectedDecoration:  BoxDecoration(
                  gradient: MyArtist.gradient.blueLinear(),
                  borderRadius: BorderRadius.circular(10),
                ),
                todayDecoration: BoxDecoration(
                  gradient: MyArtist.gradient.blueLinear(opacity: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                defaultDecoration : BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                weekendDecoration : BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                outsideDecoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                cellMargin :  const EdgeInsets.all(3.0),
                // cellPadding :  EdgeInsets.zero,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 334,
              child: MyAnimatedLimiter(
                child: GridView.count(
                  controller: controller,
                  crossAxisCount: 3,
                  physics: const BouncingScrollPhysics(),
                  childAspectRatio: 1 / .5 ,
                  shrinkWrap: true,
                  children: [ for(var e in years)  MyAnimatedLimiterItem(
                    index: years.indexOf(e),
                    crossAxisCount: 3,
                    child: Center(
                      child: MyGestureContainer(
                        onTap: (){
                          setState(() {
                            if(e != _focusedDay.value.year){
                              _focusedDay.value = DateTime(e,);
                            }
                              isSelectYear = false;
                            });
                          },
                          height: 38,
                          width: 84,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: e == _focusedDay.value.year ? MyArtist.gradient.blueLinear() : null,
                            color: e == _focusedDay.value.year ? null : MyArtist.surface,
                          ),
                          alignment: Alignment.center,
                          child: Text('$e', style:  MyStyle.text.smallTextRegular12.copyWith(color: e == _focusedDay.value.year ? MyArtist.background : MyArtist.onSurface) ,),),
                      ),
                  )],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
