import 'package:aviotrack/global.dart';
import 'package:aviotrack/widgets/helper_wiget/side_nav.dart';
import 'package:aviotrack/widgets/helper_wiget/top_bar.dart';
import 'package:aviotrack/widgets/helper_wiget/top_sidenav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class dashboard_pc extends StatelessWidget {
  const dashboard_pc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color.withOpacity(0.3),
        body: HStack([
      side_nav().w(290).h(1000),
      VStack([
        top_bar().w(1242).h(90).pOnly(top: 5, left: 4),
        Container(
          height: 30,
          width: 80,
          decoration: BoxDecoration(border: Border.all(color: Colors.transparent),borderRadius: BorderRadius.circular(50),color: primary_color.withOpacity(0.9)),
          child: Text('Hello, Guest !',style: GoogleFonts.poppins(fontSize: 10,color: Colors.white),).centered(),
        ).pOnly(left: 30,top: 15),
        Text(
          'Tracking Results',
          style: GoogleFonts.poppins(fontSize: 24, color: primary_color),
        ).pOnly(top: 12, left: 30),
        Text(
          'To track your consignment please enter any combination of up to 25 AVIOTRACK tracking numbers :',
          style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
        ).pOnly(left: 32),
        Container(
          height: 300,
          width: 700,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
              color: primary_color),
          child: VStack([
            HStack([
              VxCircle(
                radius: 16,
                border: Border.all(color: Colors.white, width: 2),
                backgroundColor: Colors.transparent,
              ),
              Text(
                'AWB / Component No',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
              ).pOnly(left: 10),
              VxCircle(
                radius: 16,
                border: Border.all(color: Colors.white, width: 2),
                backgroundColor: Colors.transparent,
              ).pOnly(left: 50),
              Text(
                'Reference Number',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
              ).pOnly(left: 10),
            ]).pOnly(left: 30, top: 20),
            Container(
              width: 650,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Consignment / Reference Number",
                ),
                style: TextStyle(),
                maxLines: 7,
              ),
            ).centered().pOnly(top: 20),
            Container(
              height: 35,
              width: 90,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('Track',style: GoogleFonts.poppins(fontSize: 15),).centered(),
            ).pOnly(left: 30,top: 15).onTap(() {print('TRACK Button');})
          ]),
        ).pOnly(top: 20, left: 30),
        HStack([
          Text('BEWARE OF FRAUD CALLS. ',style: GoogleFonts.poppins(color: Colors.red,fontSize: 15)),
          Text('AVIOTRACK ',style: GoogleFonts.poppins(fontSize: 15)),
          Text('won\'t',style: GoogleFonts.poppins(color: Colors.red,fontSize: 15)),
          Text('ask for any payment thru',style: GoogleFonts.poppins(fontSize: 15)),
          Text(' OTP/UPI',style: GoogleFonts.poppins(color: Colors.red,fontSize: 15))
        ]).pOnly(left: 30,top: 25),
        Container(
          width: 1212,
          height: 70,
            decoration: BoxDecoration(border: Border.all(color: Colors.transparent),borderRadius: BorderRadius.circular(20),color: Color(0xffE6F1C4),boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(' Our #AVIOTRACKcovid19Warriors, are striving hard each day, to ensure you stay safe at home while they reach out essentials to you. In this war against the virus, we call for your understanding that there are multiple factors that control movement of shipments across the whole country & within any city. Hence, please expect an extended delivery schedule well beyond our normal TAT.',style: GoogleFonts.notoSans(fontStyle: FontStyle.italic,fontSize: 14)).centered(),
          ),
        ).pOnly(top: 20,left: 22),
        Container(
          height: 25,
          width: 1210,
          decoration: BoxDecoration(border: Border.all(color: Colors.transparent),color: primary_color,),
          child:HStack([
            Text('Terms & Conditions |',style: GoogleFonts.poppins(color: Colors.white,fontSize: 10),).pOnly(left: 10),
            Text(' Privacy policy',style: GoogleFonts.poppins(color: Colors.white,fontSize: 10),),
            Text(' © Copyright Appikorn .All rights reserved',style: GoogleFonts.poppins(color: Colors.white,fontSize: 10),).pOnly(left: 800),

          ])
        ).pOnly(top: 50,left: 20)
      ]).hFull(context),
    ]));
  }
}
