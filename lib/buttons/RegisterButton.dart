import 'package:flutter/material.dart';
import '../components/Register.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 330,
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          child: Text('Register'),
          onPressed: () async {
            String inputError = await Register.regexTest();
            if(inputError != "") {
              //user did not provide correct format for email, username, or password.
              //input error will tell them which part of the submission they got wrong.
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Try Again.'),
                  content: Text(inputError),
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
            else {
              //if user input is all valid, it will add user to DB here.
              String ret = await Register.regUser();

              if (ret == "") {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Account created! Please check your email.'),
                    content: Text(inputError),
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
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Error'),
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
            }

          },
        ),
      ),
    );
  }
}
