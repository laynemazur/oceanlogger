import 'package:flutter/material.dart';
import '../components/Header.dart';
import '../components/HomePageWrapper.dart';
import '../components/TestPageWrapper.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  int _selectedIndex = 0; //New

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.white,
            Colors.white,
            Colors.white,
          ]),
        ),
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
              child: HomePageWrapper(),
              //child: TestPageWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}
