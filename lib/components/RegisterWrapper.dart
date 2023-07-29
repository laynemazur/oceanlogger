import 'package:flutter/material.dart';
import '../buttons/RegisterButton.dart';
import '../buttons/SignInButton.dart';
import 'Register.dart';
import '../pages/LoginPage.dart';

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
                    "Register",
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
                              builder: (context) => LoginPage()))
                    },
                    child: const Text(
                      "Have An Account?\n Sign in!",
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
              child: Register(), //Contains info for user to input sign up
            ),
            const SizedBox(height: 40,),
            RegisterButton(),
            //const SizedBox(height: 40,),
            //SignInButton()
          ],
        ),
      ),
    );
  }
}
