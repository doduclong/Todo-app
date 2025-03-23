import 'package:helper_package/src.dart';
import 'package:ui_core/src.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyCalendarPicker extends StatefulWidget {
  final bool isCalendar;
  final DateTime? initialDate;

  const MyCalendarPicker({super.key,
    this.isCalendar = true,
    this.initialDate,});

  @override
  State<MyCalendarPicker> createState() => _MyCalendarPickerState();
}

class _MyCalendarPickerState extends State<MyCalendarPicker> {


  DateTime? selectedDay;
  bool isCalendar = true;
  final formState = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedDay = widget.initialDate;
      isCalendar = widget.isCalendar;
    });
  }
  TextEditingController controllerTextEdit = TextEditingController();

  @override
  void dispose() {
    controllerTextEdit.dispose();
    super.dispose();
  }

  void setEditingFiled(){
    if(selectedDay == null)  return;
    setState(() {
      controllerTextEdit.text = selectedDay == null ? "" :MyHelper.dateTime.dmy(selectedDay);
    });
  }

  void onFieldSubmitted(String value){
    if (formState.currentState?.validate() == true) {
      formState.currentState?.save();

      setState(() {
        selectedDay = MyHelper.dateTime.convertFromString(controllerTextEdit.text);
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
          title:  MyPackageInterpreter.selectDateTime,
          detail: selectedDay == null
              ?  MyPackageInterpreter.noDateTime
              : MyHelper.dateTime.yMMMMdRange(selectedDay,),
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
          height: isCalendar ? 505 : 202,
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
                        controller: controllerTextEdit,
                        textInputAction: TextInputAction.done,
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
                  selectedDay: selectedDay,
                  isCalendarFormat: true,
                  onDaySelected: (DateTime? selectedDay, DateTime focusedDay, Set<DateTime> selectedDays){
                    setState(() {
                      this.selectedDay = selectedDay;
                      setEditingFiled();
                    });
                  },
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Center(
              child: MyTextButton(
                isEnable: selectedDay != null && selectedDay != widget.initialDate,
                text:  MyPackageInterpreter.confirm,
                onTap: (){
                  Navigator.pop(context, selectedDay);
                },
                icon: MyArtist.colorFilter.colorFilterSvg( MyAssets.icons.bold.calendar),
              ),
            )],),
        ),

      ],
    );
  }
}
