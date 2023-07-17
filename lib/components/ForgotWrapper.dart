import 'package:flutter/material.dart';
import '../buttons/LoginButton.dart';
import '../buttons/ResetButton.dart';
import 'Forgot.dart';

//Design for ForgotPage, calls Forgot which performs actions on this page
class ForgotWrapper extends StatelessWidget {
  const ForgotWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        // Scaffold keeps keyboard popup on emulator from overflowing DO NOT DELETE
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Forgot(), //Contains info for user login, password
            ),
            const SizedBox(height: 40,),
            ResetButton()
          ],
        ),
      ),
    );
  }
}