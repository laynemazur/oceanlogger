import 'package:flutter/material.dart';
import '../database/Backend.dart';

class AddLog extends StatelessWidget{
  static TextEditingController diveSiteController = TextEditingController();
  static TextEditingController locationController = TextEditingController();
  static TextEditingController dateController = TextEditingController();
  static TextEditingController timeController = TextEditingController();
  static TextEditingController maxDepthController = TextEditingController();
  static TextEditingController tempController = TextEditingController();
  static TextEditingController visibilityController = TextEditingController();
  static TextEditingController startAirPressController = TextEditingController();
  static TextEditingController endAirPressController = TextEditingController();
  static TextEditingController diveComputerController = TextEditingController();
  static TextEditingController notesController = TextEditingController();
  //TextEditingController takes user input from specified TextField

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //makes names left aligned
      children: <Widget>[
        Text("*Name:",),
        Container(
          //login design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              )
          ),

          child: TextField(
            controller: diveSiteController,
            decoration: InputDecoration(
                hintText: "Dive Site Name",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("*Location:",),
        Container(
          //login design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              )
          ),
          child: TextField(
            controller: locationController,
            decoration: InputDecoration(
                hintText: "Country, City",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("*Date:",),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: dateController,
            decoration: InputDecoration(
                hintText: "08/08/0808",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("Dive Time:",),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: timeController,
            decoration: InputDecoration(
                hintText: "Min.",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("Maximum Depth:",),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: maxDepthController,
            decoration: InputDecoration(
                hintText: "Meters",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("Temperature:",),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: tempController,
            decoration: InputDecoration(
                hintText: "Fahrenheit",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("Visibility:",),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: visibilityController,
            decoration: InputDecoration(
                hintText: "Meters",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("Starting Air Pressure:",),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: startAirPressController,
            decoration: InputDecoration(
                hintText: "Fahrenheit",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("Ending Air Pressure:",),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: endAirPressController,
            decoration: InputDecoration(
                hintText: "Meters",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("Dive Computer:",),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: diveComputerController,
            decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Text("Notes:",),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: notesController,
            decoration: InputDecoration(
                hintText: "Add notes...",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }

}