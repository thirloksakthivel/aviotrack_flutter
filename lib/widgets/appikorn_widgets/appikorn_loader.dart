import 'package:aviotrack/global.dart';
import 'package:flutter/material.dart';

class appikorn_loader extends StatelessWidget {
  const appikorn_loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            height: 170,
            width: 170,
            color: Colors.white,
          ),
          SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Loading...",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2,
              ),
            )
          ])
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
