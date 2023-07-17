import 'package:flutter/material.dart';
import '../database/Backend.dart';

class Forgot extends StatelessWidget{
  static TextEditingController emailController = TextEditingController();
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
            controller: emailController,
            decoration: InputDecoration(
                hintText: "email",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),

      ],
    );
  }

  static Future<String> forgotUser() {

    //Validate user with login API from NodeJS
    return ConnectBackend.forgotUser(emailController.text);
  }
}