import 'package:flutter/material.dart';
import '../database/Backend.dart';
import '../pages/ForgotPage.dart';

class Login extends StatelessWidget{
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
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: GestureDetector(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgotPage()))
            },
            child: const Text(
              "Forgot your password?",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  static Future<String> authUser() {

    //Validate user with login API from NodeJS
    return ConnectBackend.authenticateUser(loginController.text, passwordController.text);
}
}
