import 'package:flutter/material.dart';
import 'package:helper_package/src.dart';
import 'package:intl/intl.dart';

class $MyDateTimeHelper {
  const $MyDateTimeHelper();

  String hm(DateTime? dateTime,) {
    return dateTime == null ? "" : DateFormat('HH:mm').format(dateTime);
  }

  String jm(DateTime? dateTime,) {
    return dateTime == null ? "" : DateFormat.jm().format(dateTime);
  }

  String hms(DateTime? dateTime,) {
    return dateTime == null ? "" : DateFormat('HH:mm:ss').format(dateTime);
  }

  String dmy(DateTime? dateTime,) {
    return dateTime == null ? "" : DateFormat('dd/MM/yyyy').format(dateTime);
  }

  String ymd(DateTime? dateTime,) {
    return dateTime == null ? "" : DateFormat('yyyy-MM-dd').format(dateTime);
  }

  String hmdmy(DateTime? dateTime,) {
    return dateTime == null ? "" : DateFormat('HH:mm dd/MM/yyyy').format(dateTime,);
  }



  String yMMM(DateTime? dateTime, ) {
    return dateTime == null ? "" : DateFormat.yMMM().format(dateTime);
  }

  String yMMMMdjms(DateTime? dateTime, ) {
    return dateTime == null ? "" : DateFormat.yMMMMd().add_jms().format(dateTime,);
  }

  String y(DateTime? dateTime,) {
    return dateTime == null ? "" : DateFormat.y().format(dateTime,);
  }

  String mMMM(DateTime? dateTime, ) {
    return dateTime == null ? "" : DateFormat.MMMM().format(dateTime,);
  }

  String mMMMy(DateTime? dateTime,) {
    return dateTime == null ? "" : DateFormat.MMMM().add_y().format(dateTime,);
  }

  String eEEE(DateTime? dateTime,) {
    return dateTime == null ? "" : DateFormat.EEEE().format(dateTime,);
  }

  String e(DateTime? dateTime,) {
    return dateTime == null ? "" : DateFormat.E().format(dateTime,);
  }

  String d(DateTime? dateTime, ) {
    return dateTime == null ? "" : DateFormat.d().format(dateTime,);
  }

  String yMMMMdRange(DateTime? dateTime1,
      { DateTime? dateTime2,}) {
    if (dateTime1 == null && dateTime2 == null) return "";
    if (dateTime1 == null) {
      if (dateTime2!.year == DateTime.now().year) {
        return DateFormat.MMMMd().format(dateTime2);
      }
      return DateFormat.yMMMMd().format(dateTime2);
    }
    if (dateTime2 == null) {
      if (dateTime1.year == DateTime.now().year) {
        return DateFormat.MMMMd().format(dateTime1);
      }
      return DateFormat.yMMMMd().format(dateTime1);
    }
    if (dateTime1.year == dateTime2.year) {
      if(dateTime1.year == DateTime.now().year){
        return "${DateFormat.MMMMd().format(dateTime1)} ${MyPackageInterpreter.to} ${DateFormat.MMMMd().format(dateTime2)}";
      }
      return "${DateFormat.MMMMd().format(dateTime1)} ${MyPackageInterpreter.to} ${DateFormat.yMMMMd().format(dateTime2)}";
    }
    return "${DateFormat.yMMMMd().format(dateTime1)} ${MyPackageInterpreter.to} ${DateFormat.yMMMMd().format(dateTime2)}";
  }

  String yMMMMdHmsRange(DateTime? dateTime1,
      { DateTime? dateTime2,}) {
    if (dateTime1 == null && dateTime2 == null) return "";
    if (dateTime1 == null) {
      if (dateTime2!.year == DateTime.now().year) {
        return DateFormat.MMMMd().add_Hms().format(dateTime2);
      }
      return DateFormat.yMMMMd().add_Hms().format(dateTime2);
    }
    if (dateTime2 == null) {
      if (dateTime1.year == DateTime.now().year) {
        return DateFormat.MMMMd().add_Hms().format(dateTime1);
      }
      return DateFormat.yMMMMd().add_Hms().format(dateTime1);
    }
    if (dateTime1.year == dateTime2.year && dateTime1.year == DateTime.now().year) {
      if (dateTime1.month == dateTime2.month && dateTime1.day == dateTime2.day) {
        return "${DateFormat.MMMMd().add_Hms().format(
          dateTime1,)} ${ MyPackageInterpreter.to} ${DateFormat.Hms().format(
          dateTime2,)}";
      }
      return "${DateFormat.MMMMd().add_Hms().format(
        dateTime1,)} ${ MyPackageInterpreter.to} ${DateFormat.MMMMd().add_Hms().format(dateTime2)}";
    }
    return "${DateFormat.yMMMMd().add_Hms().format(
        dateTime1,)} ${ MyPackageInterpreter.to} ${DateFormat.yMMMMd().add_Hms().format(dateTime2)}";
  }

  String yMMMMdHmRange(DateTime? dateTime1,
      { DateTime? dateTime2,}) {
    if (dateTime1 == null && dateTime2 == null) return "";
    if (dateTime1 == null) {
      if (dateTime2!.year == DateTime.now().year) {
        return DateFormat.MMMMd().add_Hm().format(dateTime2);
      }
      return DateFormat.yMMMMd().add_Hm().format(dateTime2);
    }
    if (dateTime2 == null) {
      if (dateTime1.year == DateTime.now().year) {
        return DateFormat.MMMMd().add_Hm().format(dateTime1);
      }
      return DateFormat.yMMMMd().add_Hm().format(dateTime1);
    }
    if (dateTime1.year == dateTime2.year && dateTime1.year == DateTime.now().year) {
      if (dateTime1.month == dateTime2.month && dateTime1.day == dateTime2.day) {
        return "${DateFormat.MMMMd().add_Hm().format(
            dateTime1,)} ${ MyPackageInterpreter.to} ${DateFormat.Hm().format(
            dateTime2,)}";
      }
      return "${DateFormat.MMMMd().add_Hm().format(
          dateTime1,)} ${ MyPackageInterpreter.to} ${DateFormat.MMMMd()
          .add_Hm()
          .format(dateTime2)}";
    }
    return "${DateFormat.yMMMMd().add_Hm().format(
        dateTime1,)} ${ MyPackageInterpreter.to} ${DateFormat.yMMMMd()
        .add_Hm()
        .format(dateTime2)}";
  }

  DateTime? utcToTimeZone(DateTime? dateTime) {
    if(dateTime == null) return null;
    return dateTime.subtract(
        Duration(microseconds: -DateTime.now().timeZoneOffset.inMicroseconds),);
  }

  DateTime? timeZoneToUTC(DateTime? dateTime) {
    if(dateTime == null) return null;
    return dateTime.subtract(
        Duration(microseconds: DateTime.now().timeZoneOffset.inMicroseconds),);
  }


  DateTime? convertFromString(String? inputString){
    try {
      return DateFormat('dd/MM/yyyy').parseStrict(inputString ?? "");
    } catch (e){
      return null;
    }
  }

  DateTime maxYearAgo({int years = 150} ) {
    return DateTime(DateTime.now().year - years,);
  }

  DateTime maxYearNext({int years = 150} ) {
    return DateTime(DateTime.now().year + years,);
  }

  DateTime now({int years = 150} ) {
    return DateTime.now();
  }

  DateTime firstDateOfMonth({DateTime? dateTime}){
    dateTime ??= DateTime.now();
    return DateTime(dateTime.year, dateTime.month, );
  }

  DateTime endDateOfMonth({DateTime? dateTime}){
    dateTime ??= DateTime.now();
     return getToFinishOfDay (dateTime: DateTime(dateTime.month == 12 ? dateTime.year + 1 : dateTime.year,
        dateTime.month == 12 ? 1:  dateTime.month + 1,).subtract(const Duration(seconds: 1)),);
  }

  DateTime getToFinishOfDay({DateTime? dateTime}){
    dateTime ??= DateTime.now();
    return DateTime.tryParse("${dateTime.year}-${dateTime.month < 10 ? '0${dateTime.month}' : dateTime.month}-${dateTime.day < 10 ? '0${dateTime.day}' : dateTime.day}T23:59:59",) ?? dateTime;
  }

  bool inMaxYearAgoAndNext(DateTime? dateTime){
    if (dateTime == null) return false;
    return dateTime.isAfter(maxYearAgo()) && dateTime.isBefore(maxYearNext());
  }

  bool isToday(DateTime? dateTime){
    if (dateTime == null) return false;
    return dateTime.year == now().year &&  dateTime.month == now().month &&  dateTime.day == now().day ;
  }

  List<int> listYear({required DateTime firstDay, required DateTime lastDay} ) {
    final List<int> years = [];
    int year = firstDay.isBefore(lastDay) ? firstDay.year :lastDay.year;
    while (year <= (firstDay.isBefore(lastDay) ? lastDay.year : firstDay.year) ) {
      years.add(year);
      year++;
    }
    return years;
  }

  Future<DateTimeRange?> showMyDateRangePicker({
    DateTime? startDate,
    DateTime? endDate,
    required BuildContext context,
  })  {
    return showDateRangePicker(
        context: context,
        initialDateRange: startDate == null || endDate == null ? null : DateTimeRange(start: startDate, end: endDate,),
        firstDate: maxYearAgo(),
        lastDate: maxYearNext(),);
  }

  Future<DateTime?> showMyDatePicker({
    DateTime? initialDate,
    required BuildContext context,
  })  {
    return showDatePicker(
        context: context,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: maxYearAgo(),
        lastDate: maxYearNext(),);
  }

  Future<TimeOfDay?> showMyTimePicker({
    required DateTime initialTime,
    required BuildContext context,
  })  {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialTime),);
  }
}
