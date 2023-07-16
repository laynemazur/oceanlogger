import 'package:flutter/material.dart';
import '../database/Backend.dart';

class Register extends StatelessWidget{
  static TextEditingController loginController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  //TextEditingController takes user input from specified TextField

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[

        Container(
          //login design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              )
          ),
          child: TextField(
            controller: loginController,
            decoration: InputDecoration(
                hintText: "test",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Container(
          //password design/textbox
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(
                hintText: "test",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }
}