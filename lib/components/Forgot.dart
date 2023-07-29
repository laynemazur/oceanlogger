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
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
                hintText: "email",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
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
