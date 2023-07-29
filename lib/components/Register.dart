import 'dart:math';

import 'package:flutter/material.dart';
import '../database/Backend.dart';

class Register extends StatelessWidget{
  static TextEditingController emailController = TextEditingController();
  static TextEditingController loginController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
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
        Container(
          //login design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: loginController,
            decoration: InputDecoration(
                hintText: "username",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            ),
          ),
        ),
        Container(
          //password design/textbox
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
                hintText: "password",
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

  static Future<String> regexTest() async{
    //determines if all inputs are valid
    //username: 8-16 chars.
    //password: 8 chars, >=1 num, 1 upper, 1 lower, 1 special char
    //email: must contain @___.com

    String error = "";

    //test username:
    RegExp regexLogin = RegExp(r'^[a-zA-Z\d]{8,16}$');
    if(!regexLogin.hasMatch(loginController.text)
        || loginController.text.length < 8 || loginController.text.length > 16) {
      error += "Username must be within 8-16 characters and not contain any special characters.\n";
    }

    //test password:
    RegExp regexPassword = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*])[a-zA-Z\d!@#\$%^&*]{8,}$');
    if(!regexPassword.hasMatch(passwordController.text)) {
      error += "Password must be at least 8 characters long, and must contain one uppercase letter, one lowercase letter, one number, and one special character.\n";
    }

    RegExp regexEmail = RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');
    if(!regexEmail.hasMatch(emailController.text)) {
      error += "Email must be in the form \"example@email.com\"";
    }

    return error;
  }

  static Future<String> regUser() {

    //Validate user with login API from NodeJS
    return ConnectBackend.registerUser(emailController.text,loginController.text, passwordController.text);
  }
}
