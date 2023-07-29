import 'package:flutter/material.dart';
import '../buttons/LoginButton.dart';
import '../buttons/ResetButton.dart';
import 'Forgot.dart';
import '../pages/LoginPage.dart';

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
                    "Reset\nPassword",
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
                      "Remember your\n password?",
                      style: TextStyle(
                          fontSize: 10,
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
