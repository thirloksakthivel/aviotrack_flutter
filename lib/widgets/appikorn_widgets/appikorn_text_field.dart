import 'package:aviotrack/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class appikorn_text_field extends StatelessWidget {
  const appikorn_text_field(
      {super.key,
      this.centerText,
      this.height,
      this.maxLines,
      this.maxLength,
      this.textcolor,
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
      this.onTap,
      this.controller});

  final double? height;
  final int? maxLines;
  final int? maxLength;
  final Color? textcolor;
  final String? lable;
  final String? hint;
  final Color? fillColor;
  final Color? borderColor;
  final bool? centerText;
  final bool? border;
  final double? textsize;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? regx;
  final void Function(String?)? onChanged;
  final void Function(String)? onSaved;
  final void Function()? onTap;
  final TextEditingController? controller;
  final Widget? suffixicon;
  final Widget? preffixxicon;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (height == null ? appikorn_text_field_height : height!),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLength: maxLength ?? 20,
        maxLines: maxLines ?? 1,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(regx == null ? r'^[a-zA-Z0-9_\-=@,\.;!#%&*()$":? ]+$' : regx!))],
        keyboardType: keyboardType == null ? keyboardType : TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        textAlign: (centerText == null || centerText == false) ? TextAlign.start : TextAlign.center,
        style: TextStyle(color: textcolor ?? Colors.black, fontSize: textsize ?? 14),
        decoration: InputDecoration(
          counterText: "",
          errorStyle: const TextStyle(fontSize: 0),
          filled: true,
          fillColor: fillColor ?? Colors.grey[100],
          labelText: lable,
          labelStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.only(top: 5, left: 7, right: 7),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: (border != null || border == false) ? Colors.transparent : borderColor ?? Colors.blue, width: 2.0),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: (border != null || border == false) ? Colors.transparent : borderColor ?? Colors.blue, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: (border != null || border == false) ? Colors.transparent : borderColor ?? Colors.blue, width: 2.0),
          ),
          hintText: hint,
          suffixIcon: suffixicon,
          prefixIcon: preffixxicon,
        ),
        onSubmitted: onSaved,
        onTap: onTap,
        readOnly: readOnly ?? false,
      ),
    );
  }
}
