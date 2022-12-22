import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appikorn_country_picker extends StatefulWidget {
  appikorn_country_picker({Key? key, this.fillColor, this.country, this.state, this.city, this.countryChanged, this.stateChanged, this.cityChanged, this.showState, this.showCity}) : super(key: key);

  final Color? fillColor;
  String? country;
  String? state;
  String? city;
  final Function? countryChanged;
  final Function? stateChanged;
  final Function? cityChanged;
  final bool? showState;
  final bool? showCity;

  @override
  State<appikorn_country_picker> createState() => _appikorn_country_pickerState();
}

class _appikorn_country_pickerState extends State<appikorn_country_picker> {
  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      showCities: widget.showCity ?? false,
      showStates: widget.showState ?? false,
      currentState: (widget.state == null || widget.state == "") ? "State" : widget.state,
      currentCity: (widget.city == null || widget.city == "") ? "City" : widget.city,
      currentCountry: (widget.country == null || widget.country == "") ? "Country" : widget.country,
      onCountryChanged: (coun) {
        print(coun);
        setState(() {
          widget.country = coun;
          widget.countryChanged!(coun);
        });
      },
      onStateChanged: (stat) {
        setState(() {
          widget.state = stat;
          if (widget.stateChanged != null) widget.stateChanged!(stat);
        });
      },
      onCityChanged: (value) {
        setState(() {
          widget.city = value;
          if (widget.cityChanged != null) widget.cityChanged!(value);
        });
      },
    );
  }
}

//////////////////////////////// HOW to USE /////////////////////////////////////////

// VxBox(
// child: appikorn_country_picker(
// showState: true,
// countryChanged: (str) {
// print("this is country $str");
// },
// state: "Assam",
// stateChanged: (str) {
// print("this is state $str");
// },
// )).make().w(350).h(100).centered(),
