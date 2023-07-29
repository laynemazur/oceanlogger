import 'package:flutter/material.dart';
import '../components/Header.dart';
import '../components/AddLogWrapper.dart';

class AddLogPage extends StatelessWidget {
  const AddLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )
              ),
              child: AddLogWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}
