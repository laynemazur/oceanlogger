import 'package:flutter/material.dart';
import '../pages/DiveCalcPage.dart';

class DiveCalcButton extends StatelessWidget {
  const DiveCalcButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Dive Calculator'),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DiveCalcPage()),
          );
        },
      ),
    );
  }
}