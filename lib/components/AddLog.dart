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

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: Text("*Name:"),
        ),
        Container(
          //login design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),

          child: TextField(
            controller: diveSiteController,
            decoration: InputDecoration(
                hintText: "Dive Site Name",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: Text("*Location:"),
        ),
        Container(
          //login design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: locationController,
            decoration: InputDecoration(
                hintText: "Country, City",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: Text("*Date:"),
        ),
        Container(
          //password design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: dateController,
            decoration: InputDecoration(
                hintText: "08/08/0808",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: Text("Dive Time:"),
        ),
        Container(
          //password design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: timeController,
            decoration: InputDecoration(
                hintText: "Min.",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: Text("Maximum Depth:"),
        ),
        Container(
          //password design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: maxDepthController,
            decoration: InputDecoration(
                hintText: "Meters",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: Text("Temperature:"),
        ),
        Container(
          //password design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: tempController,
            decoration: InputDecoration(
                hintText: "Fahrenheit",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: Text("Visibility:"),
        ),
        Container(
          //password design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: visibilityController,
            decoration: InputDecoration(
                hintText: "Meters",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: Text("Starting Air Pressure:"),
        ),
        Container(
          //password design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: startAirPressController,
            decoration: InputDecoration(
                hintText: "Fahrenheit",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: Text("Ending Air Pressure:"),
        ),
        Container(
          //password design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: endAirPressController,
            decoration: InputDecoration(
                hintText: "Meters",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: Text("Dive Computer:"),
        ),
        Container(
          //password design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: diveComputerController,
            decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: Text("Notes:"),
        ),
        Container(
          //password design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: notesController,
            decoration: InputDecoration(
                hintText: "Add notes...",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
        ),
      ],
    );
  }

  static Future<String> addLog() {

    //sends API call in backend to nodeJs, returns error if there is one and updates accesstoken.
    return ConnectBackend.addDiveLog(diveSiteController.text,locationController.text,
      dateController.text,timeController.text,maxDepthController.text,
      tempController.text,visibilityController.text,startAirPressController.text,
      endAirPressController.text,diveComputerController.text,notesController.text);
  }

}
