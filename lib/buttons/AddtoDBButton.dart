import 'package:flutter/material.dart';
import '../pages/HomePage.dart';

class AddtoDBButton extends StatelessWidget {
  const AddtoDBButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Add'),
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