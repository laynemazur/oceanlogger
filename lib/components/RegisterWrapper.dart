import 'package:flutter/material.dart';
import '../buttons/RegisterButton.dart';
import '../buttons/SignInButton.dart';
import 'Register.dart';

//Design for RegisterPage, calls Register which performs actions on this page
class RegisterWrapper extends StatelessWidget {
  const RegisterWrapper({super.key});

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
              child: Register(), //Contains info for user to input sign up
            ),
            const SizedBox(height: 40,),
            RegisterButton(),
            const SizedBox(height: 40,),
            SignInButton()
          ],
        ),
      ),
    );
  }
}