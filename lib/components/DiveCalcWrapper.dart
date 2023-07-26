import 'package:flutter/material.dart';
import '../buttons/CalculateButton.dart';
import '../buttons/CancelLogButton.dart';
import 'DiveCalc.dart';

//Design for DiveCalc Page
class DiveCalcWrapper extends StatelessWidget {
  const DiveCalcWrapper({super.key});

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
              child: DiveCalc(), //Contains info for user to input sign up
            ),
            const SizedBox(height: 40,),
            CalculateButton(),
            const SizedBox(height: 40,),
            CancelLogButton(),
          ],
        ),
      ),
    );
  }
}