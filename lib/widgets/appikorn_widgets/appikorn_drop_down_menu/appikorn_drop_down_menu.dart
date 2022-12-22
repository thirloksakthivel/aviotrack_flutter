import 'package:flutter/material.dart';

import 'dependancy.dart';

class appikorn_drop_down_menu extends StatelessWidget {
  const appikorn_drop_down_menu(
      {Key? key,
      required this.parentWidget,
      required this.children,
      required this.offset,
      this.dropdownColor,
      this.dropdownElevation,
      this.dropdownRadius,
      required this.dropdownWidth,
      required this.dropdownHeight});

  final Widget parentWidget;
  final List<Widget> children;
  final Offset offset;
  final Color? dropdownColor;
  final double? dropdownRadius;
  final double dropdownWidth;
  final double dropdownHeight;
  final int? dropdownElevation;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownMenu(
        isExpanded: true,
        buttonHighlightColor: Colors.red,
        customButton: parentWidget,
        items: children
            .map((item) => DropdownMenuItem<Widget>(
                  value: item,
                  child: item,
                ))
            .toList(),
        onChanged: (value) {},
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        dropdownMaxHeight: dropdownHeight,
        dropdownWidth: dropdownWidth,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dropdownRadius ?? 14),
          color: dropdownColor ?? Colors.white,
        ),
        dropdownElevation: dropdownElevation ?? 2,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: offset,
      ),
    );
  }
}
//////////////////////////////// HOW to USE /////////////////////////////////////////

// var children = [
//   IconButton(
//       onPressed: () {
//         print("presssed");
//       },
//       icon: Icon(Icons.add)),
//   "two".text.make(),
//   "three".text.make(),
//   "three".text.make(),
//   "three".text.make(),
//   "three".text.make(),
// ];

// VxBox(
// child: appikorn_drop_down_menu(
// offset: Offset(-50, -10),
// children: children,
// parentWidget: Icon(Icons.ac_unit),
// dropdownWidth: 200,
// dropdownHeight: 200,
// )).make().w(100).centered().pSymmetric(h: 40),
