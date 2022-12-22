import 'package:aviotrack/widgets/helper_wiget/side_nav.dart';
import 'package:aviotrack/widgets/helper_wiget/top_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class top_sideNav extends StatelessWidget {
  const top_sideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: HStack([
          side_nav().w(290).h(900),
          Column(
            children: [
              top_bar().w(1240).h(300)
            ] )
        ]),
      ),
    );
  }
}
