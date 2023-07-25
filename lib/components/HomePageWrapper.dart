import 'package:flutter/material.dart';
import '../buttons/AddLogButton.dart';

//Design for LoginPage, calls Login which performs actions on this page
class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40,),
            AddLogButton()
          ],
        ),
      ),
    );
  }
}