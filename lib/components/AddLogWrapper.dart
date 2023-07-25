import 'package:flutter/material.dart';
import '../buttons/AddtoDBButton.dart';
import 'AddLog.dart';

//Design for RegisterPage, calls Register which performs actions on this page
class AddLogWrapper extends StatelessWidget {
  const AddLogWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: AddLog(), //Contains info for user to input sign up
            ),
            const SizedBox(height: 40,),
            AddtoDBButton(),
          ],
        ),
      ),
    );
  }
}