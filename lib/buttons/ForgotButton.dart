import 'package:flutter/material.dart';
import '../pages/ForgotPage.dart';

class ForgotButton extends StatelessWidget {
  const ForgotButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Forgot Password?'),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPage()),
          );
        },
      ),
    );
  }
}
