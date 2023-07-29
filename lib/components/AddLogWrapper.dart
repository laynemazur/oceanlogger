import 'package:flutter/material.dart';
import '../buttons/AddtoDBButton.dart';
import '../buttons/CancelLogButton.dart';
import 'AddLog.dart';

//Design for AddLogPage
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
              child: const Text(
                "Add Log",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 40),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: AddLog(), //Contains info for user to input sign up
            ),
            const SizedBox(height: 40,),

            const ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                CancelLogButton(),
                SizedBox(width: 5),
                AddtoDBButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
