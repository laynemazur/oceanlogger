import 'package:flutter/material.dart';
import '../pages/HomePage.dart';

class CancelLogButton extends StatelessWidget {
  const CancelLogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Cancel'),
        onPressed: () async {
          //NEED TO IMPLEMENT BACKEND HERE
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
      ),
    );
  }
}