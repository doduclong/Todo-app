import 'package:helper_package/src.dart';
import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyCalendarRangePicker extends StatefulWidget{
  final DateTime? rangeStart;
  final DateTime? rangeEnd;
  final bool isCalendar;

  const MyCalendarRangePicker({super.key,
    this.rangeStart,
    this.rangeEnd,
    this.isCalendar = true,});

  @override
  State<StatefulWidget> createState() => _MyCalendarPicker();

}

class _MyCalendarPicker extends State<MyCalendarRangePicker>{

  DateTimeRange? selectedRange;
  bool isCalendar = true;
  final formState = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    isCalendar = widget.isCalendar;
    if(widget.rangeStart != null && widget.rangeEnd != null){
      setState(() {
        selectedRange = DateTimeRange(start: widget.rangeStart!, end: widget.rangeEnd!);
      });
    }
  }
  TextEditingController controllerStart = TextEditingController();
  TextEditingController controllerEnd = TextEditingController();


  @override
  void dispose() {
    controllerStart.dispose();
    controllerEnd.dispose();
    super.dispose();
  }


  void setEditingFiled(){
    if(selectedRange == null)  return;
    setState(() {
      controllerStart.text = selectedRange == null ? "" :MyHelper.dateTime.dmy(selectedRange!.start);
      controllerEnd.text = selectedRange == null ? "" :MyHelper.dateTime.dmy(selectedRange!.end);
    });

  }

  void onFieldSubmitted(String value){
    if (formState.currentState?.validate() == true) {
      formState.currentState?.save();

      DateTime start = MyHelper.dateTime.convertFromString(controllerStart.text)!;
      DateTime end = MyHelper.dateTime.convertFromString(controllerEnd.text)!;
      final DateTime save = start;
      if(start.isAfter(end)) {
        start = end;
        end  = save;
      }
      setState(() {
        selectedRange = DateTimeRange(start: start, end: end,);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      MySimpleItem(
          padding: 30,
          title: MyPackageInterpreter.selectDateTimeRange,
          detail: selectedRange == null
              ?  MyPackageInterpreter.noDateTimeRange
              : MyHelper.dateTime.yMMMMdRange(selectedRange!.start, dateTime2: selectedRange!.end,),
        icon: MyArtist.colorFilter.colorFilterSvg(MyAssets.icons.light.x, color: MyArtist.onBackground,),
        onTap: () {
            Navigator.pop(context);
          },
          icons: [
            MyIconButton(
              color: MyArtist.background,
              onTap: () {
                setState(() {
                  isCalendar = !isCalendar;
                  if(!isCalendar)setEditingFiled();
                });
              },
              boxShadow: [MyArtist.shadow.cardShadow()],
              size: 32,
              padding: 8,
                icon: MyArtist.colorFilter.colorFilterSvg( isCalendar ? MyAssets.icons.light.edit : MyAssets.icons.light.calendar, color: MyArtist.onSurface,)
            ),
            const Gap(11),
          ],
        ),
        MyAnimatedContainer(
          duration: 200,
          isEnable: !isCalendar,
          height: isCalendar ? 505 : 318,
          child: Column(children: [ const Gap(20),
            MyVisibility(
              visible: isCalendar,
              replacement: Form(
                key: formState,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyTextField(
                        prefixIcon: MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.light.calendar, color: MyArtist.onSurface),
                        controller: controllerStart,
                        textInputAction: TextInputAction.next,
                        hintText: "E.g: 30/04/1975",
                        keyboardType: TextInputType.datetime,
                        inputFormatters: MyHelper.string.inputFormattersDMYEasy,
                        validator: (value) {
                          final datetime = MyHelper.dateTime.convertFromString(value);
                          if(!MyHelper.dateTime.inMaxYearAgoAndNext(datetime)) return  MyPackageInterpreter.periodOfAbout150Years;
                          if(datetime != null) return null;
                          return  MyPackageInterpreter.malformed;
                        },
                        onFieldSubmitted: onFieldSubmitted,
                      ),
                      const Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(child: MyDivider()),
                          const Gap(10),
                          Text( MyPackageInterpreter.to, style: MyStyle.text.smallTextRegular12),
                          const Gap(10),
                          const Expanded(child: MyDivider()),
                        ],
                      ),
                      const Gap(15),
                      MyTextField(
                        prefixIcon: MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.light.calendar,color: MyArtist.onSurface),
                        controller: controllerEnd,
                        hintText: "E.g: 30/04/1975",
                        keyboardType: TextInputType.datetime,
                        inputFormatters: MyHelper.string.inputFormattersDMYEasy,
                        validator: (value) {
                          final datetime = MyHelper.dateTime.convertFromString(value);
                          if(!MyHelper.dateTime.inMaxYearAgoAndNext(datetime)) return  MyPackageInterpreter.periodOfAbout150Years;
                          if(datetime != null) return null;
                          return  MyPackageInterpreter.malformed;
                        },
                        onFieldSubmitted: onFieldSubmitted,
                      ),

                    ],),
                ),
              ),
              child: Center(
                child: MyCalendar(
                  isCalendarFormat: true,
                  rangeEnd: selectedRange == null ? null : selectedRange!.end,
                  rangeStart: selectedRange == null ? null : selectedRange!.start,
                  onRangeSelected: (DateTime? start,
                      DateTime? end,
                      DateTime focusedDay, // Trả về tháng đang hiển thị.
                      DateTimeRange? selectedRange, ){
                    setState(() {
                      this.selectedRange = selectedRange;
                      setEditingFiled();
                    });
                  },
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: MyTextButton(
                isEnable: selectedRange != null && selectedRange != DateTimeRange(start: widget.rangeStart!, end: widget.rangeEnd!),
                text:  MyPackageInterpreter.confirm,
                onTap: (){
                  Navigator.pop(context, selectedRange);
                },
                icon: MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.bold.calendar),
              ),
            )],),
        ),

      ],
    );
  }
}
