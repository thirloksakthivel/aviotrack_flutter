import 'package:aviotrack/global.dart';
import 'package:flutter/material.dart';

import 'dependency.dart';

appikorn_date_range_picker(
    {required BuildContext context,
    Color? backgroundColor,
    bool? range,
    required Function onChanged,
    final DateTime? initialDate,
    final DateTime? firstDate,
    final DateTime? lastDate,
    final String? hint}) {
  List<DateTime?>? selected;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
          return Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor ?? Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(color: Colors.transparent),
                ),
                height: 400,
                width: 360,
                child: appikorn_date_package_data(
                  onCancelTapped: () {
                    Navigator.of(context).pop();
                  },
                  onOkTapped: () {
                    print(selected);

                    onChanged(selected);
                    Navigator.of(context).pop();
                  },
                  onValueChanged: (dates) => mystate(() => selected = dates),
                  config: appikorn_date_picker_config(
                    firstDate: firstDate,
                    lastDate: lastDate,
                    currentDate: initialDate,
                    firstDayOfWeek: 1,
                    calendarType: (range == null || range == false) ? CalendarDatePicker2Type.single : CalendarDatePicker2Type.range,
                    selectedDayTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                    selectedDayHighlightColor: primary_color,
                  ),
                  initialValue: const [],
                ),
              ),
            ),
          );
        });
      });
}

//////////////////////////////// HOW to USE /////////////////////////////////////////

// VxBox().red900.make().wh(150, 50).onTap(() {
// appikorn_date_range_picker(
// context: context,
// onChanged: (s) {
// print("this is on changed $s");
// });
// }),
