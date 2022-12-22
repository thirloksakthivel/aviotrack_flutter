import 'package:aviotrack/global.dart';
import 'package:aviotrack/widgets/appikorn_widgets/appikorn_text_field.dart';
import 'package:flutter/material.dart';

class appikorn_number_incrementor_text_field extends StatefulWidget {
  appikorn_number_incrementor_text_field({Key? key, this.height, this.textSize, this.borderColor, this.title, this.incrementor, required this.onChange, required this.initialValue});

  final double? height;
  final Function(int) onChange;
  int initialValue;
  final int? incrementor;
  final Widget? title;
  final Color? borderColor;
  final double? textSize;

  @override
  State<appikorn_number_incrementor_text_field> createState() => _appikorn_number_incrementor_text_fieldState();
}

class _appikorn_number_incrementor_text_fieldState extends State<appikorn_number_incrementor_text_field> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) Padding(padding: const EdgeInsets.only(left: 4, bottom: 10), child: widget.title!),
        Container(
          height: widget.height ?? appikorn_text_field_height,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: widget.borderColor == null ? Colors.transparent : widget.borderColor!),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    splashRadius: 27,
                    onPressed: () {
                      setState(() {
                        if (int.parse(widget.initialValue.toString()) > 0) widget.initialValue = int.parse(widget.initialValue.toString()) - (widget.incrementor == null ? 1 : widget.incrementor!);
                      });
                      widget.onChange(widget.initialValue);
                    },
                    icon: const Icon(Icons.remove)),
                SizedBox(
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3, bottom: 3),
                      child: appikorn_text_field(
                        textsize: widget.textSize ?? 20,
                        centerText: true,
                        controller: TextEditingController(text: widget.initialValue.toString()),
                        border: false,
                        hint: "0",
                        onChanged: (str) {
                          if (str!.isNotEmpty) {
                            widget.initialValue = int.parse(str.toString());
                            widget.onChange(int.parse(str.toString()));
                          } else {
                            widget.initialValue = 0;
                            widget.onChange(0);
                          }
                        },
                        keyboardType: TextInputType.phone,
                        regx: numberRegx,
                      ),
                    )),
                IconButton(
                    splashRadius: 27,
                    onPressed: () {
                      setState(() {
                        widget.initialValue = int.parse(widget.initialValue.toString()) + (widget.incrementor == null ? 1 : widget.incrementor!);
                      });
                      widget.onChange(widget.initialValue);
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////// HOW to USE /////////////////////////////////////////

// VxBox(
// child: appikorn_number_incrementor_text_field(
// onChange: (int) {
// print("this is value $int");
// },
// initialValue: 0,
// )).make().w(200).centered().pSymmetric(h: 40),
