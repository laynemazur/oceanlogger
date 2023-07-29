import 'package:flutter/material.dart';
import '../pages/HomePage.dart';
import '../components/DiveCalc.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 140,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text('Calculate'),
          onPressed: () async {
            String result = await DiveCalc.calculations();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Results'),
                  content: Text(result),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                  ],
                ),
              );
          },
        ),
      ),
    );
  }
}
