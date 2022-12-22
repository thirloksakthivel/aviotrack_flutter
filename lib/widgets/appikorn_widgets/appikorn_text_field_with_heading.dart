import 'package:flutter/material.dart';

import 'appikorn_text_field.dart';

class appikorn_text_field_with_heading extends StatelessWidget {
  final double? height;
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

  appikorn_text_field_with_heading({
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Padding(padding: const EdgeInsets.only(left: 4, bottom: 10), child: title!),
        appikorn_text_field(
          height: height,
          textcolor: textcolor,
          fillColor: fillColor,
          textsize: textsize,
          maxLength: maxLength,
          maxLines: maxLines,
          lable: lable,
          hint: hint,
          borderColor: borderColor,
          border: border,
          validator: validator,
          keyboardType: keyboardType,
          regx: regx,
          onChanged: onChanged,
          onSaved: onSaved,
          controller: controller,
          suffixicon: suffixicon,
          preffixxicon: preffixxicon,
        )
      ],
    );
  }
}
