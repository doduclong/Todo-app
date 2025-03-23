import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';

class $MyBottomSheetHelper {
  const $MyBottomSheetHelper();

  Future<T?> showMyBottomSheet<T>({
    required BuildContext context,
    Widget? child,
    List<Widget>? children,
    double? initialChildSize,
    double? maxChildSize,
    double? minChildSize,
    bool animationOn = true,
  }) {
    return showModalBottomSheet<T>(
      barrierColor: MyArtist.onBackground.withOpacity(0.3),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: MyArtist.background,
      // useSafeArea: true,
        builder: (BuildContext context) => MyBottomSheetFitter(
          children: children ?? [],
          animationOn: animationOn,
        initialChildSize: initialChildSize,
        maxChildSize: maxChildSize,
        minChildSize: minChildSize,
        child: child,
      ),
    );
  }

  Future<DateTimeRange?> showMyBottomSheetDateRangePicker({
    DateTime? rangeStart,
    DateTime? rangeEnd,
    required BuildContext context,
    double? initialChildSize,
    double? maxChildSize,
    double? minChildSize,
  }) async {
    return showMyBottomSheet<DateTimeRange>(
      context: context,
      initialChildSize: initialChildSize ?? 0.75,
      maxChildSize: maxChildSize,
      minChildSize: minChildSize,
      child: MyCalendarRangePicker(
        rangeEnd: rangeEnd,
        rangeStart: rangeStart,
      ),
    );
  }

  Future<DateTime?> showMyBottomSheetDatePicker({
    DateTime? initialDate,
    required BuildContext context,
    double? initialChildSize,
    double? maxChildSize,
    double? minChildSize,
  }) async {
    return  showMyBottomSheet<DateTime>(
      context: context,
      initialChildSize: initialChildSize ?? 0.75,
      maxChildSize: maxChildSize,
      minChildSize: minChildSize,
      child: MyCalendarPicker(
              initialDate: initialDate,
      ),
    );
  }
}
