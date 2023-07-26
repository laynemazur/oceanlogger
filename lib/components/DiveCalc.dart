import 'package:flutter/material.dart';
import '../database/Backend.dart';

class DiveCalc extends StatelessWidget{
  static TextEditingController firstDiveController = TextEditingController();
  static TextEditingController firstTotalTimeController = TextEditingController();
  static TextEditingController lenSurfaceIntervalHoursController = TextEditingController();
  static TextEditingController lenSurfaceIntervalMinsControler = TextEditingController();
  static TextEditingController secondDiveController = TextEditingController();
  //TextEditingController takes user input from specified TextField

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //makes names left aligned
      children: <Widget>[
        Text("Depth of First Dive:",),
        Container(
          //login design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              )
          ),

          child: TextField(
            controller: firstDiveController,
            decoration: InputDecoration(
                hintText: "ft",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("Total Time of First Dive:",),
        Container(
          //login design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              )
          ),
          child: TextField(
            controller: firstTotalTimeController,
            decoration: InputDecoration(
                hintText: "Mins",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("Length of Surface Interval Hours:",),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: lenSurfaceIntervalHoursController,
            decoration: InputDecoration(
                hintText: "Hrs",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("Length of Surface Interval Minutes:",),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: lenSurfaceIntervalMinsControler,
            decoration: InputDecoration(
                hintText: "Mins",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("Depth of Second Dive:",),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: secondDiveController,
            decoration: InputDecoration(
                hintText: "ft",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }

  //calculations
  static Future<String> calculations() async {
    String result = '';
    String error = ''; //if this stays empty, then result will be returned.

    var depth = int.tryParse(firstDiveController.text) ?? 0;
    var time = int.tryParse(firstTotalTimeController.text) ?? 0;
    var surface_hr = int.tryParse(lenSurfaceIntervalHoursController.text) ?? 0;
    var surface_min = int.tryParse(lenSurfaceIntervalMinsControler.text) ?? 0;
    var depth2 = int.tryParse(secondDiveController.text) ?? 0;

    var surface = surface_hr * 60 + surface_min;

    // Error Checks before calculating.
    if (depth <= 0 || depth > 140)
    {
      error +='Your first dive must be between 1 and 140 ft.\n';
    }
    if (time <= 0)
    {
      error += 'You must enter the total time of your first dive.\n';
    }
    if (surface < 10 || surface > 1440)
    {
      error += 'Your surface interval must at least 10 minutes and no greater than 24 hours.\n';
    }
    if (depth2 <= 0 || depth2 > 130)
    {
      error += 'Your second dive must be between 1 and 130 ft.\n';
    }
    if (error != '')
    {
      return error;
    }

    //no errors so far, move to table calculations.

    // stuff for the table.
    var first_group = "";
    var second_group = "";
    var rnt = 0;
    var amdt = 0;

    // TABLE 1
    // Determine the pressure group based on the time/depth of the first dive
    first_group = ((depth <= 35 && time <= 10) || (depth > 35 && depth <= 40 && time <= 9) || (depth > 40 && depth <= 50 && time <= 7) || (depth > 50 && depth <= 60 && time <= 6) || (depth > 60 && depth <= 70 && time <= 5) || (depth > 70 && depth <= 80 && time <= 4) || (depth > 80 && depth <= 90 && time <= 4) || (depth > 90 && depth <= 130 && time <= 3)) ? "a" : first_group;
    first_group = ((depth <= 35 && time > 10 && time <= 19) || (depth > 35 && depth <= 40 && time > 9 && time <= 16) || (depth > 40 && depth <= 50 && time > 7 && time <= 13) || (depth > 50 && depth <= 60 && time > 6 && time <= 11) || (depth > 60 && depth <= 70 && time > 5 && time <= 9) || (depth > 70 && depth <= 80 && time > 4 && time <= 8) || (depth > 80 && depth <= 90 && time > 4 && time <= 7) || (depth > 90 && depth <= 110 && time > 3 && time <= 6) || (depth > 110 && depth <= 130 && time > 3 && time <= 5) || (depth > 130 && depth <= 140 && time <= 4)) ? "b" : first_group;
    first_group = ((depth <= 35 && time > 19 && time <= 25) || (depth > 35 && depth <= 40 && time > 16 && time <= 22) || (depth > 40 && depth <= 50 && time > 13 && time <= 17) || (depth > 50 && depth <= 60 && time > 11 && time <= 14) || (depth > 60 && depth <= 70 && time > 9 && time <= 12) || (depth > 70 && depth <= 80 && time > 8 && time <= 10) || (depth > 80 && depth <= 90 && time > 7 && time <= 9) || (depth > 90 && depth <= 100 && time > 6 && time <= 8) || (depth > 100 && depth <= 110 && time > 6 && time <= 7) || (depth > 110 && depth <= 130 && time > 5 && time <= 6) || (depth > 130 && depth <= 140 && time > 4 && time <= 5)) ? "c" : first_group;
    first_group = ((depth <= 35 && time > 25 && time <= 29) || (depth > 35 && depth <= 40 && time > 22 && time <= 25) || (depth > 40 && depth <= 50 && time > 17 && time <= 19) || (depth > 50 && depth <= 60 && time > 14 && time <= 16) || (depth > 60 && depth <= 70 && time > 12 && time <= 13) || (depth > 70 && depth <= 80 && time > 10 && time <= 11) || (depth > 80 && depth <= 90 && time > 9 && time <= 10) || (depth > 90 && depth <= 100 && time > 8 && time <= 9) || (depth > 100 && depth <= 110 && time > 7 && time <= 8) || (depth > 110 && depth <= 130 && time > 6 && time <= 7) || (depth > 130 && depth <= 140 && time > 5 && time <= 6)) ? "d" : first_group;
    first_group = ((depth <= 35 && time > 29 && time <= 32) || (depth > 35 && depth <= 40 && time > 25 && time <= 27) || (depth > 40 && depth <= 50 && time > 19 && time <= 21) || (depth > 50 && depth <= 60 && time > 16 && time <= 17) || (depth > 60 && depth <= 70 && time > 13 && time <= 15) || (depth > 70 && depth <= 80 && time > 11 && time <= 13) || (depth > 80 && depth <= 90 && time > 10 && time <= 11) || (depth > 90 && depth <= 100 && time > 9 && time <= 10) || (depth > 100 && depth <= 110 && time > 8 && time <= 9) || (depth > 110 && depth <= 120 && time > 7 && time <= 8) || (depth > 130 && depth <= 140 && time > 7 && time <= 8)) ? "e" : first_group;
    first_group = ((depth <= 35 && time > 32 && time <= 36) || (depth > 35 && depth <= 40 && time > 27 && time <= 31) || (depth > 40 && depth <= 50 && time > 21 && time <= 24) || (depth > 50 && depth <= 60 && time > 17 && time <= 19) || (depth > 60 && depth <= 70 && time > 15 && time <= 16) || (depth > 70 && depth <= 80 && time > 13 && time <= 14) || (depth > 80 && depth <= 90 && time > 11 && time <= 12) || (depth > 90 && depth <= 100 && time > 10 && time <= 11) || (depth > 100 && depth <= 110 && time > 9 && time <= 10) || (depth > 110 && depth <= 120 && time > 8 && time <= 9) || (depth > 120 && depth <= 130 && time > 7 && time <= 8) || (depth > 130 && depth <= 140 && time > 7 && time <= 8)) ? "f" : first_group;
    first_group = ((depth <= 35 && time > 36 && time <= 40) || (depth > 35 && depth <= 40 && time > 31 && time <= 34) || (depth > 40 && depth <= 50 && time > 24 && time <= 26) || (depth > 50 && depth <= 60 && time > 19 && time <= 21) || (depth > 60 && depth <= 70 && time > 16 && time <= 18) || (depth > 70 && depth <= 80 && time > 14 && time <= 15) || (depth > 80 && depth <= 90 && time > 12 && time <= 13) || (depth > 90 && depth <= 100 && time > 11 && time <= 12) || (depth > 100 && depth <= 110 && time > 10 && time <= 11) || (depth > 110 && depth <= 120 && time > 9 && time <= 10) || (depth > 120 && depth <= 130 && time > 8 && time <= 9)) ? "g" : first_group;
    first_group = ((depth <= 35 && time > 40 && time <= 44) || (depth > 35 && depth <= 40 && time > 34 && time <= 37) || (depth > 40 && depth <= 50 && time > 26 && time <= 28) || (depth > 50 && depth <= 60 && time > 21 && time <= 23) || (depth > 60 && depth <= 70 && time > 18 && time <= 19) || (depth > 70 && depth <= 80 && time > 15 && time <= 17) || (depth > 80 && depth <= 90 && time > 13 && time <= 15) || (depth > 90 && depth <= 100 && time > 12 && time <= 13) || (depth > 100 && depth <= 110 && time > 11 && time <= 12) || (depth > 110 && depth <= 120 && time > 10 && time <= 11) || (depth > 120 && depth <= 130 && time > 9 && time <= 10)) ? "h" : first_group;
    first_group = ((depth <= 35 && time > 44 && time <= 48) || (depth > 35 && depth <= 40 && time > 37 && time <= 40) || (depth > 40 && depth <= 50 && time > 28 && time <= 31) || (depth > 50 && depth <= 60 && time > 23 && time <= 25) || (depth > 60 && depth <= 70 && time > 19 && time <= 21) || (depth > 70 && depth <= 80 && time > 17 && time <= 18) || (depth > 80 && depth <= 90 && time > 15 && time <= 16) || (depth > 90 && depth <= 100 && time > 13 && time <= 14) || (depth > 100 && depth <= 110 && time > 12 && time <= 13)) ? "i" : first_group;
    first_group = ((depth <= 35 && time > 48 && time <= 52) || (depth > 35 && depth <= 40 && time > 40 && time <= 44) || (depth > 40 && depth <= 50 && time > 31 && time <= 33) || (depth > 50 && depth <= 60 && time > 25 && time <= 27) || (depth > 60 && depth <= 70 && time > 21 && time <= 22) || (depth > 70 && depth <= 80 && time > 18 && time <= 19) || (depth > 80 && depth <= 90 && time > 16 && time <= 17) || (depth > 90 && depth <= 100 && time > 14 && time <= 15) || (depth > 110 && depth <= 120 && time > 11 && time <= 12)) ? "j" : first_group;
    first_group = ((depth <= 35 && time > 52 && time <= 57) || (depth > 35 && depth <= 40 && time > 44 && time <= 48) || (depth > 40 && depth <= 50 && time > 33 && time <= 36) || (depth > 50 && depth <= 60 && time > 27 && time <= 29) || (depth > 60 && depth <= 70 && time > 22 && time <= 24) || (depth > 70 && depth <= 80 && time > 19 && time <= 21) || (depth > 80 && depth <= 90 && time > 17 && time <= 18) || (depth > 90 && depth <= 100 && time > 15 && time <= 16) || (depth > 100 && depth <= 110 && time > 13 && time <= 14) || (depth > 110 && depth <= 120 && time > 12 && time <= 13)) ? "k" : first_group;
    first_group = ((depth <= 35 && time > 57 && time <= 62) || (depth > 35 && depth <= 40 && time > 48 && time <= 51) || (depth > 40 && depth <= 50 && time > 36 && time <= 39) || (depth > 50 && depth <= 60 && time > 29 && time <= 31) || (depth > 60 && depth <= 70 && time > 24 && time <= 26) || (depth > 70 && depth <= 80 && time > 21 && time <= 22) || (depth > 80 && depth <= 90 && time > 18 && time <= 19) || (depth > 90 && depth <= 100 && time > 16 && time <= 17) || (depth > 100 && depth <= 110 && time > 14 && time <= 15)) ? "l" : first_group;
    first_group = ((depth <= 35 && time > 52 && time <= 67) || (depth > 35 && depth <= 40 && time > 51 && time <= 55) || (depth > 40 && depth <= 50 && time > 39 && time <= 41) || (depth > 50 && depth <= 60 && time > 31 && time <= 33) || (depth > 60 && depth <= 70 && time > 26 && time <= 27) || (depth > 70 && depth <= 80 && time > 22 && time <= 23) || (depth > 80 && depth <= 90 && time > 19 && time <= 21) || (depth > 90 && depth <= 100 && time > 17 && time <= 18) || (depth > 100 && depth <= 110 && time > 15 && time <= 16)) ? "m" : first_group;
    first_group = ((depth <= 35 && time > 67 && time <= 73) || (depth > 35 && depth <= 40 && time > 55 && time <= 60) || (depth > 40 && depth <= 50 && time > 41 && time <= 44) || (depth > 50 && depth <= 60 && time > 33 && time <= 35) || (depth > 60 && depth <= 70 && time > 27 && time <= 29) || (depth > 70 && depth <= 80 && time > 23 && time <= 25) || (depth > 80 && depth <= 90 && time > 21 && time <= 22) || (depth > 90 && depth <= 100 && time > 18 && time <= 19)) ? "n" : first_group;
    first_group = ((depth <= 35 && time > 73 && time <= 79) || (depth > 35 && depth <= 40 && time > 60 && time <= 64) || (depth > 40 && depth <= 50 && time > 44 && time <= 47) || (depth > 50 && depth <= 60 && time > 35 && time <= 37) || (depth > 60 && depth <= 70 && time > 29 && time <= 31) || (depth > 70 && depth <= 80 && time > 25 && time <= 26) || (depth > 80 && depth <= 90 && time > 22 && time <= 23) || (depth > 90 && depth <= 100 && time > 19 && time <= 20)) ? "o" : first_group;
    first_group = ((depth <= 35 && time > 79 && time <= 85) || (depth > 35 && depth <= 40 && time > 64 && time <= 69) || (depth > 40 && depth <= 50 && time > 47 && time <= 50) || (depth > 50 && depth <= 60 && time > 37 && time <= 39) || (depth > 60 && depth <= 70 && time > 31 && time <= 33) || (depth > 70 && depth <= 80 && time > 26 && time <= 28) || (depth > 80 && depth <= 90 && time > 23 && time <= 24)) ? "p" : first_group;
    first_group = ((depth <= 35 && time > 85 && time <= 92) || (depth > 35 && depth <= 40 && time > 69 && time <= 74) || (depth > 40 && depth <= 50 && time > 50 && time <= 53) || (depth > 50 && depth <= 60 && time > 39 && time <= 42) || (depth > 60 && depth <= 70 && time > 33 && time <= 35) || (depth > 70 && depth <= 80 && time > 28 && time <= 29) || (depth > 80 && depth <= 90 && time > 24 && time <= 25)) ? "q" : first_group;
    first_group = ((depth <= 35 && time > 92 && time <= 100) || (depth > 35 && depth <= 40 && time > 74 && time <= 79) || (depth > 40 && depth <= 50 && time > 53 && time <= 57) || (depth > 50 && depth <= 60 && time > 42 && time <= 44) || (depth > 60 && depth <= 70 && time > 35 && time <= 36) || (depth > 70 && depth <= 80 && time > 29 && time <= 30)) ? "r" : first_group;
    first_group = ((depth <= 35 && time > 100 && time <= 108) || (depth > 35 && depth <= 40 && time > 79 && time <= 85) || (depth > 40 && depth <= 50 && time > 57 && time <= 60) || (depth > 50 && depth <= 60 && time > 44 && time <= 47) || (depth > 60 && depth <= 70 && time > 36 && time <= 38)) ? "s" : first_group;
    first_group = ((depth <= 35 && time > 108 && time <= 117) || (depth > 35 && depth <= 40 && time > 85 && time <= 91) || (depth > 40 && depth <= 50 && time > 60 && time <= 63) || (depth > 50 && depth <= 60 && time > 47 && time <= 49) || (depth > 60 && depth <= 70 && time > 38 && time <= 40)) ? "t" : first_group;
    first_group = ((depth <= 35 && time > 117 && time <= 127) || (depth > 35 && depth <= 40 && time > 91 && time <= 97) || (depth > 40 && depth <= 50 && time > 63 && time <= 67) || (depth > 50 && depth <= 60 && time > 49 && time <= 52)) ? "u" : first_group;
    first_group = ((depth <= 35 && time > 127 && time <= 139) || (depth > 35 && depth <= 40 && time > 97 && time <= 104) || (depth > 40 && depth <= 50 && time > 67 && time <= 71) || (depth > 50 && depth <= 60 && time > 52 && time <= 54)) ? "v" : first_group;
    first_group = ((depth <= 35 && time > 139 && time <= 152) || (depth > 35 && depth <= 40 && time > 104 && time <= 111) || (depth > 40 && depth <= 50 && time > 71 && time <= 75) || (depth > 50 && depth <= 60 && time > 54 && time <= 55)) ? "w" : first_group;
    first_group = ((depth <= 35 && time > 152 && time <= 168) || (depth > 35 && depth <= 40 && time > 111 && time <= 120) || (depth > 40 && depth <= 50 && time > 75 && time <= 80)) ? "x" : first_group;
    first_group = ((depth <= 35 && time > 168 && time <= 188) || (depth > 35 && depth <= 40 && time > 120 && time <= 129)) ? "y" : first_group;
    first_group = ((depth <= 35 && time > 188 && time <= 205) || (depth > 35 && depth <= 40 && time > 129 && time <= 140)) ? "z" : first_group;

    if (first_group == "")
    {
      error += 'The time/depth of your first dive is beyond the no-decompression table limits. Please enter a shallower depth and/or shorter dive time.\n';
      return error;
    }

    // TABLE 2
    // Determine the pressure group after the first dive and surface interval
    switch (first_group)
        {
      case "a":
        second_group = "a";
        break;

      case "b":
        second_group = (surface >= 48) ? "a" : "b";
        break;

      case "c":
        second_group = (surface >= 70) ? "a" : second_group;
        second_group = (surface < 70 && surface >= 22) ? "b" : second_group;
        second_group = (surface < 22) ? "c" : second_group;
        break;

      case "d":
        second_group = (surface >= 79) ? "a" : second_group;
        second_group = (surface < 79 && surface >= 31) ? "b" : second_group;
        second_group = (surface < 31 && surface >= 9) ? "c" : second_group;
        second_group = (surface < 9) ? "d" : second_group;
        break;

      case "e":
        second_group = (surface >= 88) ? "a" : second_group;
        second_group = (surface < 88 && surface >= 39) ? "b" : second_group;
        second_group = (surface < 39 && surface >= 17) ? "c" : second_group;
        second_group = (surface < 17 && surface >= 8) ? "d" : second_group;
        second_group = (surface < 8) ? "e" : second_group;
        break;

      case "f":
        second_group = (surface >= 95) ? "a" : second_group;
        second_group = (surface < 95 && surface >= 47) ? "b" : second_group;
        second_group = (surface < 47 && surface >= 25) ? "c" : second_group;
        second_group = (surface < 25 && surface >= 16) ? "d" : second_group;
        second_group = (surface < 16 && surface >= 8) ? "e" : second_group;
        second_group = (surface < 8) ? "f" : second_group;
        break;

      case "g":
        second_group = (surface >= 102) ? "a" : second_group;
        second_group = (surface < 102 && surface >= 54) ? "b" : second_group;
        second_group = (surface < 54 && surface >= 32) ? "c" : second_group;
        second_group = (surface < 32 && surface >= 23) ? "d" : second_group;
        second_group = (surface < 23 && surface >= 14) ? "e" : second_group;
        second_group = (surface < 14 && surface >= 7) ? "f" : second_group;
        second_group = (surface < 7) ? "g" : second_group;
        break;

      case "h":
        second_group = (surface >= 108) ? "a" : second_group;
        second_group = (surface < 108 && surface >= 60) ? "b" : second_group;
        second_group = (surface < 60 && surface >= 38) ? "c" : second_group;
        second_group = (surface < 38 && surface >= 29) ? "d" : second_group;
        second_group = (surface < 29 && surface >= 21) ? "e" : second_group;
        second_group = (surface < 21 && surface >= 13) ? "f" : second_group;
        second_group = (surface < 13 && surface >= 6) ? "g" : second_group;
        second_group = (surface < 6) ? "h" : second_group;
        break;

      case "i":
        second_group = (surface >= 114) ? "a" : second_group;
        second_group = (surface < 114 && surface >= 66) ? "b" : second_group;
        second_group = (surface < 66 && surface >= 44) ? "c" : second_group;
        second_group = (surface < 44 && surface >= 35) ? "d" : second_group;
        second_group = (surface < 35 && surface >= 27) ? "e" : second_group;
        second_group = (surface < 27 && surface >= 19) ? "f" : second_group;
        second_group = (surface < 19 && surface >= 12) ? "g" : second_group;
        second_group = (surface < 12 && surface >= 6) ? "h" : second_group;
        second_group = (surface < 6) ? "i" : second_group;
        break;

      case "j":
        second_group = (surface >= 120) ? "a" : second_group;
        second_group = (surface < 120 && surface >= 72) ? "b" : second_group;
        second_group = (surface < 72 && surface >= 50) ? "c" : second_group;
        second_group = (surface < 50 && surface >= 41) ? "d" : second_group;
        second_group = (surface < 41 && surface >= 32) ? "e" : second_group;
        second_group = (surface < 32 && surface >= 25) ? "f" : second_group;
        second_group = (surface < 25 && surface >= 18) ? "g" : second_group;
        second_group = (surface < 18 && surface >= 12) ? "h" : second_group;
        second_group = (surface < 12 && surface >= 6) ? "i" : second_group;
        second_group = (surface < 6) ? "j" : second_group;
        break;

      case "k":
        second_group = (surface >= 125) ? "a" : second_group;
        second_group = (surface < 125 && surface >= 77) ? "b" : second_group;
        second_group = (surface < 77 && surface >= 55) ? "c" : second_group;
        second_group = (surface < 55 && surface >= 46) ? "d" : second_group;
        second_group = (surface < 46 && surface >= 38) ? "e" : second_group;
        second_group = (surface < 38 && surface >= 30) ? "f" : second_group;
        second_group = (surface < 30 && surface >= 23) ? "g" : second_group;
        second_group = (surface < 23 && surface >= 17) ? "h" : second_group;
        second_group = (surface < 17 && surface >= 11) ? "i" : second_group;
        second_group = (surface < 11 && surface >= 5) ? "j" : second_group;
        second_group = (surface < 5) ? "k" : second_group;
        break;

      case "l":


        second_group = (surface >= 130) ? "a" : second_group;
        second_group = (surface < 130 && surface >= 82) ? "b" : second_group;
        second_group = (surface < 82 && surface >= 60) ? "c" : second_group;
        second_group = (surface < 60 && surface >= 51) ? "d" : second_group;
        second_group = (surface < 51 && surface >= 43) ? "e" : second_group;
        second_group = (surface < 43 && surface >= 35) ? "f" : second_group;
        second_group = (surface < 35 && surface >= 28) ? "g" : second_group;
        second_group = (surface < 28 && surface >= 22) ? "h" : second_group;
        second_group = (surface < 22 && surface >= 16) ? "i" : second_group;
        second_group = (surface < 16 && surface >= 10) ? "j" : second_group;
        second_group = (surface < 10 && surface >= 5) ? "k" : second_group;
        second_group = (surface < 5) ? "l" : second_group;
        break;

      case "m":


        second_group = (surface >= 135) ? "a" : second_group;
        second_group = (surface < 135 && surface >= 86) ? "b" : second_group;
        second_group = (surface < 86 && surface >= 66) ? "c" : second_group;
        second_group = (surface < 66 && surface >= 56) ? "d" : second_group;
        second_group = (surface < 56 && surface >= 47) ? "e" : second_group;
        second_group = (surface < 47 && surface >= 40) ? "f" : second_group;
        second_group = (surface < 40 && surface >= 33) ? "g" : second_group;
        second_group = (surface < 33 && surface >= 26) ? "h" : second_group;
        second_group = (surface < 26 && surface >= 20) ? "i" : second_group;
        second_group = (surface < 20 && surface >= 15) ? "j" : second_group;
        second_group = (surface < 15 && surface >= 10) ? "k" : second_group;
        second_group = (surface < 10 && surface >= 5) ? "l" : second_group;
        second_group = (surface < 5) ? "m" : second_group;
        break;

      case "n":


        second_group = (surface >= 139) ? "a" : second_group;
        second_group = (surface < 139 && surface >= 91) ? "b" : second_group;
        second_group = (surface < 91 && surface >= 69) ? "c" : second_group;
        second_group = (surface < 69 && surface >= 60) ? "d" : second_group;
        second_group = (surface < 60 && surface >= 52) ? "e" : second_group;
        second_group = (surface < 52 && surface >= 44) ? "f" : second_group;
        second_group = (surface < 44 && surface >= 37) ? "g" : second_group;
        second_group = (surface < 37 && surface >= 31) ? "h" : second_group;
        second_group = (surface < 31 && surface >= 25) ? "i" : second_group;
        second_group = (surface < 25 && surface >= 19) ? "j" : second_group;
        second_group = (surface < 19 && surface >= 14) ? "k" : second_group;
        second_group = (surface < 14 && surface >= 9) ? "l" : second_group;
        second_group = (surface < 9 && surface >= 4) ? "m" : second_group;
        second_group = (surface < 4) ? "n" : second_group;
        break;

      case "o":


        second_group = (surface >= 144) ? "a" : second_group;
        second_group = (surface < 144 && surface >= 95) ? "b" : second_group;
        second_group = (surface < 95 && surface >= 73) ? "c" : second_group;
        second_group = (surface < 73 && surface >= 64) ? "d" : second_group;
        second_group = (surface < 64 && surface >= 56) ? "e" : second_group;
        second_group = (surface < 56 && surface >= 48) ? "f" : second_group;
        second_group = (surface < 48 && surface >= 42) ? "g" : second_group;
        second_group = (surface < 42 && surface >= 35) ? "h" : second_group;
        second_group = (surface < 35 && surface >= 29) ? "i" : second_group;
        second_group = (surface < 29 && surface >= 24) ? "j" : second_group;
        second_group = (surface < 24 && surface >= 18) ? "k" : second_group;
        second_group = (surface < 18 && surface >= 13) ? "l" : second_group;
        second_group = (surface < 13 && surface >= 9) ? "m" : second_group;
        second_group = (surface < 9 && surface >= 4) ? "n" : second_group;
        second_group = (surface < 4) ? "o" : second_group;
        break;

      case "p":


        second_group = (surface >= 148) ? "a" : second_group;
        second_group = (surface < 148 && surface >= 99) ? "b" : second_group;
        second_group = (surface < 99 && surface >= 77) ? "c" : second_group;
        second_group = (surface < 77 && surface >= 68) ? "d" : second_group;
        second_group = (surface < 68 && surface >= 60) ? "e" : second_group;
        second_group = (surface < 60 && surface >= 52) ? "f" : second_group;
        second_group = (surface < 52 && surface >= 46) ? "g" : second_group;
        second_group = (surface < 46 && surface >= 39) ? "h" : second_group;
        second_group = (surface < 39 && surface >= 33) ? "i" : second_group;
        second_group = (surface < 33 && surface >= 28) ? "j" : second_group;
        second_group = (surface < 28 && surface >= 22) ? "k" : second_group;
        second_group = (surface < 22 && surface >= 17) ? "l" : second_group;
        second_group = (surface < 17 && surface >= 13) ? "m" : second_group;
        second_group = (surface < 13 && surface >= 8) ? "n" : second_group;
        second_group = (surface < 8 && surface >= 4) ? "o" : second_group;
        second_group = (surface < 4) ? "p" : second_group;
        break;

      case "q":


        second_group = (surface >= 151) ? "a" : second_group;
        second_group = (surface < 151 && surface >= 103) ? "b" : second_group;
        second_group = (surface < 103 && surface >= 81) ? "c" : second_group;
        second_group = (surface < 81 && surface >= 72) ? "d" : second_group;
        second_group = (surface < 72 && surface >= 64) ? "e" : second_group;
        second_group = (surface < 64 && surface >= 56) ? "f" : second_group;
        second_group = (surface < 56 && surface >= 49) ? "g" : second_group;
        second_group = (surface < 49 && surface >= 43) ? "h" : second_group;
        second_group = (surface < 43 && surface >= 37) ? "i" : second_group;
        second_group = (surface < 37 && surface >= 31) ? "j" : second_group;
        second_group = (surface < 31 && surface >= 26) ? "k" : second_group;
        second_group = (surface < 26 && surface >= 21) ? "l" : second_group;
        second_group = (surface < 21 && surface >= 17) ? "m" : second_group;
        second_group = (surface < 17 && surface >= 12) ? "n" : second_group;
        second_group = (surface < 12 && surface >= 8) ? "o" : second_group;
        second_group = (surface < 8 && surface >= 4) ? "p" : second_group;
        second_group = (surface < 4) ? "q" : second_group;
        break;

      case "r":


        second_group = (surface >= 155) ? "a" : second_group;
        second_group = (surface < 155 && surface >= 107) ? "b" : second_group;
        second_group = (surface < 107 && surface >= 85) ? "c" : second_group;
        second_group = (surface < 85 && surface >= 76) ? "d" : second_group;
        second_group = (surface < 76 && surface >= 68) ? "e" : second_group;
        second_group = (surface < 68 && surface >= 60) ? "f" : second_group;
        second_group = (surface < 60 && surface >= 53) ? "g" : second_group;
        second_group = (surface < 53 && surface >= 47) ? "h" : second_group;
        second_group = (surface < 47 && surface >= 41) ? "i" : second_group;
        second_group = (surface < 41 && surface >= 35) ? "j" : second_group;
        second_group = (surface < 35 && surface >= 30) ? "k" : second_group;
        second_group = (surface < 30 && surface >= 25) ? "l" : second_group;
        second_group = (surface < 25 && surface >= 20) ? "m" : second_group;
        second_group = (surface < 20 && surface >= 16) ? "n" : second_group;
        second_group = (surface < 16 && surface >= 12) ? "o" : second_group;
        second_group = (surface < 12 && surface >= 8) ? "p" : second_group;
        second_group = (surface < 8 && surface >= 4) ? "q" : second_group;
        second_group = (surface < 4) ? "r" : second_group;
        break;

      case "s":


        second_group = (surface >= 159) ? "a" : second_group;
        second_group = (surface < 159 && surface >= 110) ? "b" : second_group;
        second_group = (surface < 110 && surface >= 88) ? "c" : second_group;
        second_group = (surface < 88 && surface >= 79) ? "d" : second_group;
        second_group = (surface < 79 && surface >= 71) ? "e" : second_group;
        second_group = (surface < 71 && surface >= 64) ? "f" : second_group;
        second_group = (surface < 64 && surface >= 57) ? "g" : second_group;
        second_group = (surface < 57 && surface >= 50) ? "h" : second_group;
        second_group = (surface < 50 && surface >= 44) ? "i" : second_group;
        second_group = (surface < 44 && surface >= 39) ? "j" : second_group;
        second_group = (surface < 39 && surface >= 33) ? "k" : second_group;
        second_group = (surface < 33 && surface >= 28) ? "l" : second_group;
        second_group = (surface < 28 && surface >= 24) ? "m" : second_group;
        second_group = (surface < 24 && surface >= 19) ? "n" : second_group;
        second_group = (surface < 19 && surface >= 15) ? "o" : second_group;
        second_group = (surface < 15 && surface >= 11) ? "p" : second_group;
        second_group = (surface < 11 && surface >= 7) ? "q" : second_group;
        second_group = (surface < 7 && surface >= 4) ? "r" : second_group;
        second_group = (surface < 4) ? "s" : second_group;
        break;

      case "t":


        second_group = (surface >= 162) ? "a" : second_group;
        second_group = (surface < 162 && surface >= 114) ? "b" : second_group;
        second_group = (surface < 114 && surface >= 92) ? "c" : second_group;
        second_group = (surface < 92 && surface >= 83) ? "d" : second_group;
        second_group = (surface < 83 && surface >= 74) ? "e" : second_group;
        second_group = (surface < 74 && surface >= 67) ? "f" : second_group;
        second_group = (surface < 67 && surface >= 60) ? "g" : second_group;
        second_group = (surface < 60 && surface >= 54) ? "h" : second_group;
        second_group = (surface < 54 && surface >= 48) ? "i" : second_group;
        second_group = (surface < 48 && surface >= 42) ? "j" : second_group;
        second_group = (surface < 42 && surface >= 37) ? "k" : second_group;
        second_group = (surface < 37 && surface >= 32) ? "l" : second_group;
        second_group = (surface < 32 && surface >= 27) ? "m" : second_group;
        second_group = (surface < 27 && surface >= 23) ? "n" : second_group;
        second_group = (surface < 23 && surface >= 18) ? "o" : second_group;
        second_group = (surface < 18 && surface >= 14) ? "p" : second_group;
        second_group = (surface < 14 && surface >= 11) ? "q" : second_group;
        second_group = (surface < 11 && surface >= 7) ? "r" : second_group;
        second_group = (surface < 7 && surface >= 3) ? "s" : second_group;
        second_group = (surface < 3) ? "t" : second_group;
        break;

      case "u":


        second_group = (surface >= 165) ? "a" : second_group;
        second_group = (surface < 165 && surface >= 117) ? "b" : second_group;
        second_group = (surface < 117 && surface >= 95) ? "c" : second_group;
        second_group = (surface < 95 && surface >= 86) ? "d" : second_group;
        second_group = (surface < 86 && surface >= 78) ? "e" : second_group;
        second_group = (surface < 78 && surface >= 70) ? "f" : second_group;
        second_group = (surface < 70 && surface >= 63) ? "g" : second_group;
        second_group = (surface < 63 && surface >= 57) ? "h" : second_group;
        second_group = (surface < 57 && surface >= 51) ? "i" : second_group;
        second_group = (surface < 51 && surface >= 45) ? "j" : second_group;
        second_group = (surface < 45 && surface >= 40) ? "k" : second_group;
        second_group = (surface < 40 && surface >= 35) ? "l" : second_group;
        second_group = (surface < 35 && surface >= 30) ? "m" : second_group;
        second_group = (surface < 30 && surface >= 26) ? "n" : second_group;
        second_group = (surface < 26 && surface >= 22) ? "o" : second_group;
        second_group = (surface < 22 && surface >= 18) ? "p" : second_group;
        second_group = (surface < 18 && surface >= 14) ? "q" : second_group;
        second_group = (surface < 14 && surface >= 10) ? "r" : second_group;
        second_group = (surface < 10 && surface >= 7) ? "s" : second_group;
        second_group = (surface < 7 && surface >= 3) ? "t" : second_group;
        second_group = (surface < 3) ? "u" : second_group;
        break;

      case "v":


        second_group = (surface >= 168) ? "a" : second_group;
        second_group = (surface < 168 && surface >= 120) ? "b" : second_group;
        second_group = (surface < 120 && surface >= 98) ? "c" : second_group;
        second_group = (surface < 98 && surface >= 89) ? "d" : second_group;
        second_group = (surface < 89 && surface >= 81) ? "e" : second_group;
        second_group = (surface < 81 && surface >= 73) ? "f" : second_group;
        second_group = (surface < 73 && surface >= 66) ? "g" : second_group;
        second_group = (surface < 66 && surface >= 60) ? "h" : second_group;
        second_group = (surface < 60 && surface >= 54) ? "i" : second_group;
        second_group = (surface < 54 && surface >= 48) ? "j" : second_group;
        second_group = (surface < 48 && surface >= 43) ? "k" : second_group;
        second_group = (surface < 43 && surface >= 38) ? "l" : second_group;
        second_group = (surface < 38 && surface >= 34) ? "m" : second_group;
        second_group = (surface < 34 && surface >= 29) ? "n" : second_group;
        second_group = (surface < 29 && surface >= 25) ? "o" : second_group;
        second_group = (surface < 25 && surface >= 21) ? "p" : second_group;
        second_group = (surface < 21 && surface >= 17) ? "q" : second_group;
        second_group = (surface < 17 && surface >= 13) ? "r" : second_group;
        second_group = (surface < 13 && surface >= 10) ? "s" : second_group;
        second_group = (surface < 10 && surface >= 6) ? "t" : second_group;
        second_group = (surface < 6 && surface >= 3) ? "u" : second_group;
        second_group = (surface < 3) ? "v" : second_group;
        break;

      case "w":


        second_group = (surface >= 171) ? "a" : second_group;
        second_group = (surface < 171 && surface >= 123) ? "b" : second_group;
        second_group = (surface < 123 && surface >= 101) ? "c" : second_group;
        second_group = (surface < 101 && surface >= 92) ? "d" : second_group;
        second_group = (surface < 92 && surface >= 84) ? "e" : second_group;
        second_group = (surface < 84 && surface >= 76) ? "f" : second_group;
        second_group = (surface < 76 && surface >= 69) ? "g" : second_group;
        second_group = (surface < 69 && surface >= 63) ? "h" : second_group;
        second_group = (surface < 63 && surface >= 57) ? "i" : second_group;
        second_group = (surface < 57 && surface >= 51) ? "j" : second_group;
        second_group = (surface < 51 && surface >= 46) ? "k" : second_group;
        second_group = (surface < 46 && surface >= 41) ? "l" : second_group;
        second_group = (surface < 41 && surface >= 37) ? "m" : second_group;
        second_group = (surface < 37 && surface >= 32) ? "n" : second_group;
        second_group = (surface < 32 && surface >= 28) ? "o" : second_group;
        second_group = (surface < 28 && surface >= 24) ? "p" : second_group;
        second_group = (surface < 24 && surface >= 20) ? "q" : second_group;
        second_group = (surface < 20 && surface >= 16) ? "r" : second_group;
        second_group = (surface < 16 && surface >= 13) ? "s" : second_group;
        second_group = (surface < 13 && surface >= 9) ? "t" : second_group;
        second_group = (surface < 9 && surface >= 6) ? "u" : second_group;
        second_group = (surface < 6 && surface >= 3) ? "v" : second_group;
        second_group = (surface < 3) ? "w" : second_group;
        break;

      case "x":


        second_group = (surface >= 174) ? "a" : second_group;
        second_group = (surface < 174 && surface >= 126) ? "b" : second_group;
        second_group = (surface < 126 && surface >= 104) ? "c" : second_group;
        second_group = (surface < 104 && surface >= 95) ? "d" : second_group;
        second_group = (surface < 95 && surface >= 87) ? "e" : second_group;
        second_group = (surface < 87 && surface >= 79) ? "f" : second_group;
        second_group = (surface < 79 && surface >= 72) ? "g" : second_group;
        second_group = (surface < 72 && surface >= 66) ? "h" : second_group;
        second_group = (surface < 66 && surface >= 60) ? "i" : second_group;
        second_group = (surface < 60 && surface >= 54) ? "j" : second_group;
        second_group = (surface < 54 && surface >= 49) ? "k" : second_group;
        second_group = (surface < 49 && surface >= 44) ? "l" : second_group;
        second_group = (surface < 44 && surface >= 40) ? "m" : second_group;
        second_group = (surface < 40 && surface >= 35) ? "n" : second_group;
        second_group = (surface < 35 && surface >= 31) ? "o" : second_group;
        second_group = (surface < 31 && surface >= 27) ? "p" : second_group;
        second_group = (surface < 27 && surface >= 23) ? "q" : second_group;
        second_group = (surface < 23 && surface >= 19) ? "r" : second_group;
        second_group = (surface < 19 && surface >= 16) ? "s" : second_group;
        second_group = (surface < 16 && surface >= 12) ? "t" : second_group;
        second_group = (surface < 12 && surface >= 9) ? "u" : second_group;
        second_group = (surface < 9 && surface >= 6) ? "v" : second_group;
        second_group = (surface < 6 && surface >= 3) ? "w" : second_group;
        second_group = (surface < 3) ? "x" : second_group;
        break;

      case "y":


        second_group = (surface >= 177) ? "a" : second_group;
        second_group = (surface < 177 && surface >= 129) ? "b" : second_group;
        second_group = (surface < 129 && surface >= 107) ? "c" : second_group;
        second_group = (surface < 107 && surface >= 98) ? "d" : second_group;
        second_group = (surface < 98 && surface >= 90) ? "e" : second_group;
        second_group = (surface < 90 && surface >= 82) ? "f" : second_group;
        second_group = (surface < 82 && surface >= 75) ? "g" : second_group;
        second_group = (surface < 75 && surface >= 69) ? "h" : second_group;
        second_group = (surface < 69 && surface >= 63) ? "i" : second_group;
        second_group = (surface < 63 && surface >= 57) ? "j" : second_group;
        second_group = (surface < 57 && surface >= 52) ? "k" : second_group;
        second_group = (surface < 52 && surface >= 47) ? "l" : second_group;
        second_group = (surface < 47 && surface >= 42) ? "m" : second_group;
        second_group = (surface < 42 && surface >= 38) ? "n" : second_group;
        second_group = (surface < 38 && surface >= 34) ? "o" : second_group;
        second_group = (surface < 34 && surface >= 30) ? "p" : second_group;
        second_group = (surface < 30 && surface >= 26) ? "q" : second_group;
        second_group = (surface < 26 && surface >= 22) ? "r" : second_group;
        second_group = (surface < 22 && surface >= 19) ? "s" : second_group;
        second_group = (surface < 19 && surface >= 15) ? "t" : second_group;
        second_group = (surface < 15 && surface >= 12) ? "u" : second_group;
        second_group = (surface < 12 && surface >= 9) ? "v" : second_group;
        second_group = (surface < 9 && surface >= 6) ? "w" : second_group;
        second_group = (surface < 6 && surface >= 3) ? "x" : second_group;
        second_group = (surface < 3) ? "y" : second_group;
        break;

      case "z":


        second_group = (surface >= 180) ? "a" : second_group;
        second_group = (surface < 180 && surface >= 132) ? "b" : second_group;
        second_group = (surface < 132 && surface >= 110) ? "c" : second_group;
        second_group = (surface < 110 && surface >= 101) ? "d" : second_group;
        second_group = (surface < 101 && surface >= 92) ? "e" : second_group;
        second_group = (surface < 92 && surface >= 85) ? "f" : second_group;
        second_group = (surface < 85 && surface >= 78) ? "g" : second_group;
        second_group = (surface < 78 && surface >= 72) ? "h" : second_group;
        second_group = (surface < 72 && surface >= 66) ? "i" : second_group;
        second_group = (surface < 66 && surface >= 60) ? "j" : second_group;
        second_group = (surface < 60 && surface >= 55) ? "k" : second_group;
        second_group = (surface < 55 && surface >= 50) ? "l" : second_group;
        second_group = (surface < 50 && surface >= 45) ? "m" : second_group;
        second_group = (surface < 45 && surface >= 41) ? "n" : second_group;
        second_group = (surface < 41 && surface >= 36) ? "o" : second_group;
        second_group = (surface < 36 && surface >= 32) ? "p" : second_group;
        second_group = (surface < 32 && surface >= 29) ? "q" : second_group;
        second_group = (surface < 29 && surface >= 25) ? "r" : second_group;
        second_group = (surface < 25 && surface >= 21) ? "s" : second_group;
        second_group = (surface < 21 && surface >= 18) ? "t" : second_group;
        second_group = (surface < 18 && surface >= 15) ? "u" : second_group;
        second_group = (surface < 15 && surface >= 12) ? "v" : second_group;
        second_group = (surface < 12 && surface >= 9) ? "w" : second_group;
        second_group = (surface < 9 && surface >= 6) ? "x" : second_group;
        second_group = (surface < 6 && surface >= 3) ? "y" : second_group;
        second_group = (surface < 3) ? "z" : second_group;
        break;
    }

    // TABLE 3
    // Determine the RNT and AMDT based on the post-SIT pressure group and the planned depth of the second dive
    switch (second_group)
        {
      case "a":
        if (depth2 <=35) {rnt = 10; amdt = 195;}
        else if (depth2 <= 40) {rnt = 9; amdt = 131;}
        else if (depth2 <= 50) {rnt = 7; amdt = 73;}
        else if (depth2 <= 60) {rnt = 6; amdt = 49;}
        else if (depth2 <= 70) {rnt = 5; amdt = 35;}
        else if (depth2 <= 80) {rnt = 4; amdt = 26;}
        else if (depth2 <= 90) {rnt = 4; amdt = 21;}
        else if (depth2 <= 100) {rnt = 3; amdt = 17;}
        else if (depth2 <= 110) {rnt = 3; amdt = 13;}
        else if (depth2 <= 120) {rnt = 3; amdt = 10;}
        else if (depth2 <= 130) {rnt = 3; amdt = 7;}
        break;

      case "b":
        if (depth2 <=35) {rnt = 19; amdt = 186;}
        else if (depth2 <= 40) {rnt = 16; amdt = 124;}
        else if (depth2 <= 50) {rnt = 13; amdt = 67;}
        else if (depth2 <= 60) {rnt = 11; amdt = 44;}
        else if (depth2 <= 70) {rnt = 9; amdt = 31;}
        else if (depth2 <= 80) {rnt = 8; amdt = 22;}
        else if (depth2 <= 90) {rnt = 7; amdt = 18;}
        else if (depth2 <= 100) {rnt = 6; amdt = 14;}
        else if (depth2 <= 110) {rnt = 6; amdt = 10;}
        else if (depth2 <= 120) {rnt = 5; amdt = 8;}
        else if (depth2 <= 130) {rnt = 5; amdt = 5;}
        break;

      case "c":
        if (depth2 <=35) {rnt = 25; amdt = 180;}
        else if (depth2 <= 40) {rnt = 22; amdt = 118;}
        else if (depth2 <= 50) {rnt = 17; amdt = 63;}
        else if (depth2 <= 60) {rnt = 14; amdt = 41;}
        else if (depth2 <= 70) {rnt = 12; amdt = 28;}
        else if (depth2 <= 80) {rnt = 10; amdt = 20;}
        else if (depth2 <= 90) {rnt = 9; amdt = 16;}
        else if (depth2 <= 100) {rnt = 8; amdt = 12;}
        else if (depth2 <= 110) {rnt = 7; amdt = 9;}
        else if (depth2 <= 120) {rnt = 6; amdt = 7;}
        else if (depth2 <= 130) {rnt = 6; amdt = 4;}
        break;

      case "d":
        if (depth2 <=35) {rnt = 29; amdt = 176;}
        else if (depth2 <= 40) {rnt = 25; amdt = 115;}
        else if (depth2 <= 50) {rnt = 19; amdt = 61;}
        else if (depth2 <= 60) {rnt = 16; amdt = 39;}
        else if (depth2 <= 70) {rnt = 13; amdt = 27;}
        else if (depth2 <= 80) {rnt = 11; amdt = 19;}
        else if (depth2 <= 90) {rnt = 10; amdt = 15;}
        else if (depth2 <= 100) {rnt = 9; amdt = 11;}
        else if (depth2 <= 110) {rnt = 8; amdt = 8;}
        else if (depth2 <= 120) {rnt = 7; amdt = 6;}
        else if (depth2 <= 130) {rnt = 7; amdt = 3;}
        break;

      case "e":
        if (depth2 <=35) {rnt = 32; amdt = 173;}
        else if (depth2 <= 40) {rnt = 27; amdt = 113;}
        else if (depth2 <= 50) {rnt = 21; amdt = 59;}
        else if (depth2 <= 60) {rnt = 17; amdt = 38;}
        else if (depth2 <= 70) {rnt = 15; amdt = 25;}
        else if (depth2 <= 80) {rnt = 13; amdt = 17;}
        else if (depth2 <= 90) {rnt = 11; amdt = 14;}
        else if (depth2 <= 100) {rnt = 10; amdt = 10;}
        else if (depth2 <= 110) {rnt = 9; amdt = 7;}
        else if (depth2 <= 120) {rnt = 8; amdt = 5;}
        else if (depth2 <= 130) {rnt = 8;}
        break;

      case "f":
        if (depth2 <=35) {rnt = 36; amdt = 169;}
        else if (depth2 <= 40) {rnt = 31; amdt = 109;}
        else if (depth2 <= 50) {rnt = 24; amdt = 56;}
        else if (depth2 <= 60) {rnt = 19; amdt = 36;}
        else if (depth2 <= 70) {rnt = 16; amdt = 24;}
        else if (depth2 <= 80) {rnt = 14; amdt = 16;}
        else if (depth2 <= 90) {rnt = 12; amdt = 13;}
        else if (depth2 <= 100) {rnt = 11; amdt = 9;}
        else if (depth2 <= 110) {rnt = 10; amdt = 6;}
        else if (depth2 <= 120) {rnt = 9; amdt = 4;}
        else if (depth2 <= 130) {rnt = 8;}
        break;

      case "g":
        if (depth2 <=35) {rnt = 40; amdt = 165;}
        else if (depth2 <= 40) {rnt = 34; amdt = 106;}
        else if (depth2 <= 50) {rnt = 26; amdt = 54;}
        else if (depth2 <= 60) {rnt = 21; amdt = 34;}
        else if (depth2 <= 70) {rnt = 18; amdt = 22;}
        else if (depth2 <= 80) {rnt = 15; amdt = 15;}
        else if (depth2 <= 90) {rnt = 13; amdt = 12;}
        else if (depth2 <= 100) {rnt = 12; amdt = 8;}
        else if (depth2 <= 110) {rnt = 11; amdt = 5;}
        else if (depth2 <= 120) {rnt = 10; amdt = 3;}
        else if (depth2 <= 130) {rnt = 9;}
        break;

      case "h":
        if (depth2 <=35) {rnt = 44; amdt = 161;}
        else if (depth2 <= 40) {rnt = 37; amdt = 103;}
        else if (depth2 <= 50) {rnt = 28; amdt = 52;}
        else if (depth2 <= 60) {rnt = 23; amdt = 32;}
        else if (depth2 <= 70) {rnt = 19; amdt = 21;}
        else if (depth2 <= 80) {rnt = 17; amdt = 13;}
        else if (depth2 <= 90) {rnt = 15; amdt = 10;}
        else if (depth2 <= 100) {rnt = 13; amdt = 7;}
        else if (depth2 <= 110) {rnt = 12; amdt = 4;}
        else if (depth2 <= 120) {rnt = 11; amdt = 2;}
        else if (depth2 <= 130) {rnt = 10;}
        break;

      case "i":
        if (depth2 <=35) {rnt = 48; amdt = 157;}
        else if (depth2 <= 40) {rnt = 40; amdt = 100;}
        else if (depth2 <= 50) {rnt = 31; amdt = 49;}
        else if (depth2 <= 60) {rnt = 25; amdt = 30;}
        else if (depth2 <= 70) {rnt = 21; amdt = 19;}
        else if (depth2 <= 80) {rnt = 18; amdt = 12;}
        else if (depth2 <= 90) {rnt = 16; amdt = 9;}
        else if (depth2 <= 100) {rnt = 14; amdt = 6;}
        else if (depth2 <= 110) {rnt = 13; amdt = 3;}
        else if (depth2 <= 120) {rnt = 12;}
        break;

      case "j":
        if (depth2 <=35) {rnt = 52; amdt = 153;}
        else if (depth2 <= 40) {rnt = 44; amdt = 96;}
        else if (depth2 <= 50) {rnt = 33; amdt = 47;}
        else if (depth2 <= 60) {rnt = 27; amdt = 28;}
        else if (depth2 <= 70) {rnt = 22; amdt = 18;}
        else if (depth2 <= 80) {rnt = 19; amdt = 11;}
        else if (depth2 <= 90) {rnt = 17; amdt = 8;}
        else if (depth2 <= 100) {rnt = 15; amdt = 5;}
        else if (depth2 <= 110) {rnt = 14; amdt = 2;}
        else if (depth2 <= 120) {rnt = 12;}
        break;

      case "k":
        if (depth2 <=35) {rnt = 57; amdt = 148;}
        else if (depth2 <= 40) {rnt = 48; amdt = 92;}
        else if (depth2 <= 50) {rnt = 36; amdt = 44;}
        else if (depth2 <= 60) {rnt = 29; amdt = 26;}
        else if (depth2 <= 70) {rnt = 24; amdt = 16;}
        else if (depth2 <= 80) {rnt = 21; amdt = 9;}
        else if (depth2 <= 90) {rnt = 18; amdt = 7;}
        else if (depth2 <= 100) {rnt = 16; amdt = 4;}
        else if (depth2 <= 110) {rnt = 14; amdt = 2;}
        else if (depth2 <= 120) {rnt = 13;}
        break;

      case "l":
        if (depth2 <=35) {rnt = 62; amdt = 143;}
        else if (depth2 <= 40) {rnt = 51; amdt = 89;}
        else if (depth2 <= 50) {rnt = 38; amdt = 42;}
        else if (depth2 <= 60) {rnt = 31; amdt = 24;}
        else if (depth2 <= 70) {rnt = 26; amdt = 14;}
        else if (depth2 <= 80) {rnt = 22; amdt = 8;}
        else if (depth2 <= 90) {rnt = 19; amdt = 6;}
        else if (depth2 <= 100) {rnt = 17; amdt = 3;}
        else if (depth2 <= 110) {rnt = 15;}
        break;

      case "m":
        if (depth2 <=35) {rnt = 67; amdt = 138;}
        else if (depth2 <= 40) {rnt = 55; amdt = 85;}
        else if (depth2 <= 50) {rnt = 41; amdt = 39;}
        else if (depth2 <= 60) {rnt = 33; amdt = 22;}
        else if (depth2 <= 70) {rnt = 27; amdt = 13;}
        else if (depth2 <= 80) {rnt = 23; amdt = 7;}
        else if (depth2 <= 90) {rnt = 21; amdt = 4;}
        else if (depth2 <= 100) {rnt = 18; amdt = 2;}
        else if (depth2 <= 110) {rnt = 16;}
        break;

      case "n":
        if (depth2 <=35) {rnt = 73; amdt = 132;}
        else if (depth2 <= 40) {rnt = 60; amdt = 80;}
        else if (depth2 <= 50) {rnt = 44; amdt = 36;}
        else if (depth2 <= 60) {rnt = 35; amdt = 20;}
        else if (depth2 <= 70) {rnt = 29; amdt = 11;}
        else if (depth2 <= 80) {rnt = 25; amdt = 5;}
        else if (depth2 <= 90) {rnt = 22; amdt = 3;}
        else if (depth2 <= 100) {rnt = 19;}
        break;

      case "o":
        if (depth2 <=35) {rnt = 79; amdt = 126;}
        else if (depth2 <= 40) {rnt = 64; amdt = 76;}
        else if (depth2 <= 50) {rnt = 47; amdt = 33;}
        else if (depth2 <= 60) {rnt = 37; amdt = 18;}
        else if (depth2 <= 70) {rnt = 31; amdt = 9;}
        else if (depth2 <= 80) {rnt = 26; amdt = 4;}
        else if (depth2 <= 90) {rnt = 23; amdt = 2;}
        else if (depth2 <= 100) {rnt = 20;}
        break;

      case "p":
        if (depth2 <=35) {rnt = 85; amdt = 120;}
        else if (depth2 <= 40) {rnt = 69; amdt = 71;}
        else if (depth2 <= 50) {rnt = 50; amdt = 30;}
        else if (depth2 <= 60) {rnt = 39; amdt = 16;}
        else if (depth2 <= 70) {rnt = 33; amdt = 7;}
        else if (depth2 <= 80) {rnt = 28; amdt = 2;}
        else if (depth2 <= 90) {rnt = 24;}
        break;

      case "q":
        if (depth2 <=35) {rnt = 92; amdt = 113;}
        else if (depth2 <= 40) {rnt = 74; amdt = 66;}
        else if (depth2 <= 50) {rnt = 53; amdt = 27;}
        else if (depth2 <= 60) {rnt = 42; amdt = 13;}
        else if (depth2 <= 70) {rnt = 34; amdt = 6;}
        else if (depth2 <= 80) {rnt = 29;}
        else if (depth2 <= 90) {rnt = 25;}
        break;

      case "r":
        if (depth2 <=35) {rnt = 100; amdt = 105;}
        else if (depth2 <= 40) {rnt = 79; amdt = 61;}
        else if (depth2 <= 50) {rnt = 57; amdt = 23;}
        else if (depth2 <= 60) {rnt = 44; amdt = 11;}
        else if (depth2 <= 70) {rnt = 36; amdt = 4;}
        else if (depth2 <= 80) {rnt = 30;}
        break;

      case "s":
        if (depth2 <=35) {rnt = 108; amdt = 97;}
        else if (depth2 <= 40) {rnt = 85; amdt = 55;}
        else if (depth2 <= 50) {rnt = 60; amdt = 20;}
        else if (depth2 <= 60) {rnt = 47; amdt = 8;}
        else if (depth2 <= 70) {rnt = 38; amdt = 2;}
        break;

      case "t":
        if (depth2 <=35) {rnt = 117; amdt = 88;}
        else if (depth2 <= 40) {rnt = 91; amdt = 49;}
        else if (depth2 <= 50) {rnt = 63; amdt = 17;}
        else if (depth2 <= 60) {rnt = 49; amdt = 6;}
        else if (depth2 <= 70) {rnt = 40;}
        break;

      case "u":
        if (depth2 <=35) {rnt = 127; amdt = 78;}
        else if (depth2 <= 40) {rnt = 97; amdt = 43;}
        else if (depth2 <= 50) {rnt = 67; amdt = 13;}
        else if (depth2 <= 60) {rnt = 52; amdt = 3;}
        break;

      case "v":
        if (depth2 <=35) {rnt = 139; amdt = 66;}
        else if (depth2 <= 40) {rnt = 104; amdt = 36;}
        else if (depth2 <= 50) {rnt = 71; amdt = 9;}
        else if (depth2 <= 60) {rnt = 54; amdt = 1;}
        break;

      case "w":
        if (depth2 <=35) {rnt = 152; amdt = 53;}
        else if (depth2 <= 40) {rnt = 111; amdt = 29;}
        else if (depth2 <= 50) {rnt = 75; amdt = 5;}
        else if (depth2 <= 60) {rnt = 55;}
        break;

      case "x":
        if (depth2 <=35) {rnt = 168; amdt = 37;}
        else if (depth2 <= 40) {rnt = 120; amdt = 20;}
        else if (depth2 <= 50) {rnt = 50;}
        break;

      case "y":
        if (depth2 <=35) {rnt = 188; amdt = 17;}
        else if (depth2 <= 40) {rnt = 129; amdt = 11;}
        break;

      case "z":
        if (depth2 <=35) {rnt = 205;}
        else if (depth2 <= 40) {rnt = 140;}
        break;
    }

    // Final Error Check.
    if (rnt == 0)
    {
      error += 'Avoid repetitive dives over 100 ft.\n';
      return error;
    }

    // Final Answer.
    result +=
    'Pressure group after the first dive is ${first_group.toUpperCase()}.\n'
        'Pressure group after the surface interval is ${second_group.toUpperCase()}.\n';

    if (rnt != 0 && amdt != 0)
    {
      result +=
      'Residual Nitrogen Time is $rnt minutes.\nAdjusted maximum no-decompression bottom time is $amdt minutes.\n';

    }
    else if (rnt != 0)
    {
      result += 'Residual Nitrogen Time is $rnt minutes.\nNo second no-decompression dive is possible.\n';

    }
    else
    {
      result += 'No limit.\n';
    }

    return result; //called by Calculate button

  }

}

