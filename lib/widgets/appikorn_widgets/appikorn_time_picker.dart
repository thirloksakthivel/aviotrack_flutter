import 'package:aviotrack/global.dart';
import 'package:flutter/material.dart';

TimeOfDay selectedTime = TimeOfDay.now();

Future<void> appikorn_time_picker({required BuildContext context, required Function onChanged, String? hint}) async {
  final TimeOfDay? picked = await showTimePicker(
    helpText: hint,
    context: context,
    initialTime: selectedTime,
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: primary_color,
          colorScheme: ColorScheme.light(primary: primary_color),
          buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        ),
      );
    },
  );

  onChanged(picked);
}

//////////////////////////////// HOW to USE /////////////////////////////////////////

// VxBox().red900.make().wh(150, 50).onTap(() {
// appikorn_time_picker(
// context: context,
// onChanged: (s) {
// print("this is on changed $s");
// });
// }),
