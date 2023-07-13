import 'package:flutter/material.dart';
import '../pages/HomePage.dart';
import '../components/Login.dart';
import 'dart:convert';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Login'),
        onPressed: () async {
          String retError = "";
          String ret = await Login.authUser();
          var jsonObject = json.decode(ret);
          print(jsonObject);

          retError = jsonObject["error"];

          if (retError == "") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Error'),
                content: Text(retError),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
