import 'package:flutter/material.dart';
import '../buttons/LoginButton.dart';
import '../buttons/SignUpButton.dart';
import '../buttons/ForgotButton.dart';
import 'Login.dart';
import '../pages/RegisterPage.dart';

//Design for LoginPage, calls Login which performs actions on this page
class LoginWrapper extends StatelessWidget {
  const LoginWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        // Scaffold keeps keyboard popup on emulator from overflowing DO NOT DELETE
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/006-shark-1.png",
                  width: 100 ),
            ),
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 40),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()))
                    },
                    child: const Text(
                      "No Account?\n Sign up",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Login(), //Contains info for user login, password
            ),
            const SizedBox(height: 40,),
            LoginButton(),
            //const SizedBox(height: 40,),
            //SignUpButton(),
            //const SizedBox(height: 40,),
            //ForgotButton()
          ],
        ),
      ),
    );
  }
}
