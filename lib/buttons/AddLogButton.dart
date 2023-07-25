import 'package:flutter/material.dart';
import '../pages/AddLogPage.dart';

class AddLogButton extends StatelessWidget {
  const AddLogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Add Log'),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddLogPage()),
          );
        },
      ),
    );
  }
}