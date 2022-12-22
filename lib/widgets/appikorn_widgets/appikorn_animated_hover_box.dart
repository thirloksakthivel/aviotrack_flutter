import 'package:aviotrack/global.dart';
import 'package:flutter/cupertino.dart';

class appikorn_animated_hover_box extends StatefulWidget {
  const appikorn_animated_hover_box(
      {Key? key,
      this.animationDuration,
      required this.child,
      required this.fromHeight,
      this.toHeight,
      required this.fromWidth,
      this.toWidth,
      this.fromRadius,
      this.toRadius,
      this.fromColor,
      this.toColor,
      this.elevation,
      this.childFromColor,
      this.childToColor})
      : super(key: key);

  final Duration? animationDuration;
  final double fromHeight;
  final child;
  final double? toHeight;
  final double fromWidth;
  final double? toWidth;
  final double? fromRadius;
  final double? toRadius;
  final Color? fromColor;
  final Color? toColor;
  final double? elevation;
  final Color? childFromColor;
  final Color? childToColor;

  @override
  State<appikorn_animated_hover_box> createState() => _appikorn_animated_hover_boxState();
}

class _appikorn_animated_hover_boxState extends State<appikorn_animated_hover_box> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (s) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (s) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
          onTapDown: (s) {
            setState(() {
              isHovered = true;
            });
          },
          onTapUp: (s) {
            setState(() {
              isHovered = false;
            });
          },
          child: AnimatedContainer(
            height: isHovered ? widget.toHeight ?? widget.fromHeight : widget.fromHeight,
            width: isHovered ? widget.toWidth ?? widget.fromWidth : widget.fromWidth,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(isHovered ? widget.toRadius ?? widget.fromRadius ?? 5 : widget.fromRadius ?? 5),
              ),
              color: isHovered ? widget.toColor ?? widget.fromColor ?? primary_color : widget.fromColor ?? primary_color,
            ),
            child: widget.child(hovered: isHovered),
          )),
    );
  }
}

//////////////////////////////// HOW to USE /////////////////////////////////////////

// class testPage extends StatelessWidget {
//   testPage({Key? key}) : super(key: key);
//
//
//   Widget child({hovered}) {
//     return (hovered
//         ? Text("normal", style: TextStyle(color: Colors.black))
//         : Text(
//       "hovered",
//       style: TextStyle(color: Colors.white),
//     ))
//         .centered();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: VxBox(
//           child: appikorn_animated_hover_box(
//             fromHeight: 60,
//             fromWidth: 200,
//             toHeight: 120,
//             toRadius: 10,
//             toColor: Colors.yellow,
//             child: child,
//           )).make().centered(),
//     );
//   }
// }
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
