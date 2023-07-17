import 'package:flutter/material.dart';
import '../pages/LoginPage.dart';
import '../components/Forgot.dart';

//ResetButton currently just takes user back to sign in page. they received an email unless their email DNE
class ResetButton extends StatelessWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Send reset email'),
        onPressed: () async {
          String ret = await Forgot.forgotUser();

          if (ret == "") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Email is not connected to an account'),
                content: Text(ret),
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