import 'package:flutter/material.dart';
import '../database/Backend.dart';

class Login extends StatelessWidget{
  static TextEditingController loginController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[

        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              )
          ),
          child: TextField(
            controller: loginController,
            decoration: InputDecoration(
                hintText: "username",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(
                hintText: "password",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }

  static Future<String> authUser() {
    print(ConnectBackend.authenticateUser(loginController.text, passwordController.text)); //test
    return ConnectBackend.authenticateUser(loginController.text, passwordController.text);
}
}