import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:aviotrack/global.dart';

class side_nav extends StatelessWidget {
  const side_nav({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HStack([
      Container(
        height: 1000,
        width: 290,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.transparent),
          color: primary_color,
        ),
        child: VStack([
          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/aviotrak_logo.png', height: 120)),
          ).centered(),
          // Divider(
          //   thickness: 1,
          //   color: Colors.white,
          // ),
          Container(
            color: Colors.transparent,
            child: HStack([
              Icon(Icons.apartment, color: icon_color, size: icon_size)
                  .pOnly(left: 10),
              Text(
                'Corporate Profile',
                style: TextStyle(color: Colors.white),
              ).pOnly(left: 15)
            ]).pOnly(top: 20, left: 25),
          ).pOnly(top: 100).onTap(() {print('hello Thirlok');}),
          Container(
            child: HStack([
              Icon(Icons.map, color: icon_color, size: icon_size)
                  .pOnly(left: 10),
              Text(
                'Tracking',
                style: TextStyle(color: Colors.white),
              ).pOnly(left: 15)
            ]).pOnly(top: 20, left: 25),
          ),
          Container(
            child: HStack([
              Icon(Icons.settings, color: icon_color, size: icon_size)
                  .pOnly(left: 10),
              Text(
                'Service guide',
                style: TextStyle(color: Colors.white),
              ).pOnly(left: 15)
            ]).pOnly(top: 20, left: 25),
          ),
          Container(
            child: HStack([
              Icon(Icons.account_box, color: icon_color, size: icon_size)
                  .pOnly(left: 10),
              Text(
                'Franchisee',
                style: TextStyle(color: Colors.white),
              ).pOnly(left: 15)
            ]).pOnly(top: 20, left: 25),
          ),
          Container(
            child: HStack([
              Icon(Icons.call_made, color: icon_color, size: icon_size)
                  .pOnly(left: 10),
              Text(
                'Coorporate solutions',
                style: TextStyle(color: Colors.white),
              ).pOnly(left: 15)
            ]).pOnly(top: 20, left: 25),
          ),
          Container(
            child: HStack([
              Icon(Icons.group, color: icon_color, size: icon_size)
                  .pOnly(left: 10),
              Text(
                'Careers',
                style: TextStyle(color: Colors.white),
              ).pOnly(left: 15)
            ]).pOnly(top: 20, left: 25),
          ),
          Container(
            child: HStack([
              Icon(Icons.call, color: icon_color, size: icon_size)
                  .pOnly(left: 10),
              Text(
                'Contact us',
                style: TextStyle(color: Colors.white),
              ).pOnly(left: 15)
            ]).pOnly(top: 20, left: 25),
          ),
          Container(
            child: HStack([
              Icon(Icons.currency_exchange, color: icon_color, size: icon_size)
                  .pOnly(left: 10),
              Text(
                'GST',
                style: TextStyle(color: Colors.white),
              ).pOnly(left: 15)
            ]).pOnly(top: 20, left: 25),
          ),
        ]),
      )
    ]));
  }
}
