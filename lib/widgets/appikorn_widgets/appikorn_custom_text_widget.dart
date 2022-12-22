import 'package:flutter/material.dart';

class appikorn_text_field_with_widget extends StatelessWidget {
  final double? height;
  final double? width;
  final int? maxLines;
  final int? maxLength;
  final Color? textcolor;
  final String? lable;
  final Widget? title;
  final String? hint;
  final Color? fillColor;
  final Color? borderColor;
  final bool? border;
  final double? textsize;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? regx;
  void Function(String?)? onSaved;
  void Function(String?)? onChanged;
  TextEditingController? controller;
  final Widget? suffixicon;
  final Widget? preffixxicon;
  final Widget child;

  appikorn_text_field_with_widget({
    super.key,
    this.height,
    this.maxLines,
    this.maxLength,
    this.textcolor,
    this.lable,
    this.title,
    this.hint,
    this.fillColor,
    this.borderColor,
    this.border,
    this.textsize,
    this.validator,
    this.keyboardType,
    this.regx,
    this.suffixicon,
    this.preffixxicon,
    this.onSaved,
    this.onChanged,
    this.controller,
    required this.child,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 10),
              child: title!),
        Container(
          padding: const EdgeInsets.only(bottom: 10, left: 4),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(
                color: (border != null || border == false)
                    ? Colors.transparent
                    : borderColor ?? Colors.blue,
                width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: child,
        )
      ],
    );
  }
}
