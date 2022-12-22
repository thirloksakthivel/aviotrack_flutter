import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aviotrack/global.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../appikorn_list_view.dart';
import '../appikorn_text_field.dart';
import 'dependancy.dart';

class appikorn_dropdown_searchable_text_field extends StatelessWidget {
  TextEditingController txt_controller = TextEditingController();
  appikorn_dropdown_searchable_text_field(
      {super.key,
      required this.context,
      required this.list,
      required this.controller,
      this.height,
      this.dropdownColor,
      this.maxLines,
      this.maxLength,
      this.textcolor,
      this.dropdown_textcolor,
      this.lable,
      this.hint,
      this.readOnly,
      this.fillColor,
      this.borderColor,
      this.border,
      this.textsize,
      this.validator,
      this.keyboardType,
      this.regx,
      this.suffixicon,
      this.preffixxicon,
      this.onChanged,
      this.onSaved,
      this.onTap});

  final DropdownEditingController controller;
  final double? height;
  final Color? dropdownColor;
  final BuildContext context;
  final int? maxLines;
  final int? maxLength;
  final Color? textcolor;
  final Color? dropdown_textcolor;
  final String? lable;
  final String? hint;
  final Color? fillColor;
  final Color? borderColor;
  final bool? border;
  final double? textsize;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? regx;
  final void Function(dynamic?)? onChanged;
  final void Function(dynamic)? onSaved;
  final void Function()? onTap;
  final Widget? suffixicon;
  final Widget? preffixxicon;
  final bool? readOnly;
  final List<String> list;

  Widget bottomsheet() {
    return appikorn_text_field(
      height: height,
      border: border,
      controller: TextEditingController(text: controller.value),
      suffixicon: suffixicon,
      readOnly: true,
      onTap: () {
        print("cliced");
        show_model();
      },
    );
  }

  //for mobile
  void show_model() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * .8,
              decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), color: Colors.white),
              height: MediaQuery.of(context).size.height * .55,
              constraints: const BoxConstraints(minWidth: 400),
              child: Column(
                children: [
                  15.heightBox,
                  appikorn_text_field(
                    height: height,
                    hint: controller.value,
                    border: border,
                    controller: txt_controller,
                    onChanged: (s) {
                      mystate(() {});
                    },
                    suffixicon: const Icon(Icons.close).onTap(() {
                      Navigator.of(context).pop();
                    }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .45,
                    child: GestureDetector(
                      onTap: () {},
                      child: appikorn_list_view(count: list.length, child: bottom_sheet_card),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }

  bottom_sheet_card({index}) {
    return !(list[index].contains(txt_controller.text))
        ? null
        : GestureDetector(
            onTap: () {
              onChanged!(list[index]);
              Navigator.of(context).pop();
            },
            child: Container(
              height: 50,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  1.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(list[index]),
                  ),
                  const Divider(
                    height: 0.5,
                  )
                ],
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return !kIsWeb
        ? bottomsheet()
        : DropdownFormField(
            emptyActionText: "",
            controller: controller,
            onEmptyActionPressed: () async {},
            decoration: InputDecoration(
              counterText: "",
              labelText: lable,
              labelStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: fillColor ?? Colors.grey[100],
              border: (border != null || border == false)
                  ? null
                  : OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor ?? Colors.blue, width: 2.0),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
              enabledBorder: (border != null || border == false)
                  ? null
                  : OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: borderColor ?? Colors.blue, width: 2.0),
                    ),
              focusedBorder: (border != null || border == false)
                  ? null
                  : OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: borderColor ?? Colors.blue, width: 2.0),
                    ),
              suffixIcon: suffixicon,
              prefixIcon: preffixxicon,
            ),
            onSaved: (dynamic str) {},
            dropdownColor: dropdownColor ?? Colors.white,
            onChanged: onChanged,
            validator: (dynamic str) {
              return null;
            },
            displayItemFn: (dynamic item) => Text(
              item ?? '',
              style: TextStyle(fontSize: textsize ?? 14, color: Colors.blueGrey),
            ),
            findFn: (dynamic str) async => list,
            filterFn: (dynamic item, str) => item.toLowerCase().indexOf(str.toLowerCase()) >= 0,
            dropdownItemFn: (dynamic item, index, focused, dynamic lastSelectedItem, onTap) {
              print("scrolling $item");
              return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
                return GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 40,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        1.heightBox,
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            item,
                            style: TextStyle(color: dropdown_textcolor ?? Colors.black),
                          ),
                        ),
                        const Divider(
                          height: 0.5,
                        )
                      ],
                    ),
                  ),
                );
              });
            },
            dropdownHeight: 200,
          ).h(appikorn_text_field_height).centered();
  }
}

//////////////////////////////// HOW to USE /////////////////////////////////////////

// var list = [
//   dummy(name: "one", code: 1),
//   dummy(name: "two", code: 2),
//   dummy(name: "three", code: 3),
//   dummy(name: "four", code: 4),
//   dummy(name: "five", code: 5),
//   dummy(name: "six", code: 6),
//   dummy(name: "seven", code: 7),
//   dummy(name: "eight", code: 8),
//   dummy(name: "four", code: 4),
//   dummy(name: "five", code: 5),
//   dummy(name: "six", code: 6),
//   dummy(name: "seven", code: 7),
//   dummy(name: "eight", code: 8),
// ];

// VxBox(
// child: appikorn_dropdown_searchable_text_field(
// controller: DropdownEditingController<String>(value: "Please select value"),
// hint: "Type To Search",
// list: [for (var k in list) k.name!],
// onChanged: (s) {
// print("saved dooi $s");
// var dat = list.indexWhere((element) => element.name == s);
// print(json.encode(list[dat]));
// },
// )).make().wh(500, 60).centered().pSymmetric(h: 40));
//

////////////////////////// DUMMY MODEL CLASS//////////////////////////////

//
// class dummy {
//   String? name;
//   int? code;
//
//   dummy({this.name, this.code});
//
//   dummy.fromJson(Map<String, dynamic> json) {
//     name = json['name '];
//     code = json['code'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name '] = this.name;
//     data['code'] = this.code;
//     return data;
//   }
// }
