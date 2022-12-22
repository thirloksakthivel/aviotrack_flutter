import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:aviotrack/global.dart';
import 'package:google_fonts/google_fonts.dart';

class top_bar extends StatelessWidget {
  top_bar({Key? key}) : super(key: key);

  final List<String> items = [
    'My profile',
    'Contact us',
    'Log out',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color.withOpacity(0.01),
      body: Column( children: [
        Container(
            height: 85,
            width: 1238,
            decoration: BoxDecoration(
                color: primary_color,
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(8)),
            child: HStack(
              [
                HStack(
                  [
                    Text('HOME',style: GoogleFonts.poppins(color: Colors.white)).onTap(() {
                      print('HOME');
                    }),
                    Text('    |',style: GoogleFonts.poppins(color: Colors.white)),
                    Text('  GLOBAL',style: GoogleFonts.poppins(color: Colors.white)).onTap(() {
                      print('GLOBAL');
                    }),
                    Text('    |',style: GoogleFonts.poppins(color: Colors.white)),
                    Text('  SITEMAP',style: GoogleFonts.poppins(color: Colors.white)).onTap(() {
                      print('SITEMAP');
                    }),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.account_circle,size: 35,),
                    ).pOnly(left: 20)
                  ],
                  alignment: MainAxisAlignment.end,
                ).pOnly(top: 1).w(1200),
              ],
              alignment: MainAxisAlignment.start,
            ).h(1000)
        )
      ],mainAxisAlignment: MainAxisAlignment.start,),
    );
  }
}
