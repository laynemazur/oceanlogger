import 'package:flutter/material.dart';
import '../pages/HomePage.dart';
import '../components/Login.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Login'),
        onPressed: () async {
          bool authenticationResult = await Login.authUser();

          if (authenticationResult) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Error'),
                content: Text('User/Pass Incorrect'),
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
