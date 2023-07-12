import 'package:flutter/material.dart';

import '../buttons/LoginButton.dart';
import 'Login.dart';

//Design for LoginPage, calls Login which performs actions on this page
class LoginWrapper extends StatelessWidget {
  const LoginWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        // Scaffold keeps keyboard popup on emulator from overflowing do not delete
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Login(),
            ),
            const SizedBox(height: 40,),
            LoginButton()
          ],
        ),
      ),
    );
  }
}