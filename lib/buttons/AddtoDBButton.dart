import 'package:flutter/material.dart';
import '../pages/HomePage.dart';
import '../components/AddLog.dart';

class AddtoDBButton extends StatelessWidget {
  const AddtoDBButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Add'),
        onPressed: () async {
          String ret = await AddLog.addLog();
          if (ret == "") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Error'),
                content: Text(ret),
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
          }
        },
      ),
    );
  }
}