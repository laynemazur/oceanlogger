import 'package:flutter/material.dart';
import '../components/Header.dart';
import '../components/DiveCalcWrapper.dart';

class DiveCalcPage extends StatelessWidget {
  const DiveCalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.cyan,
            Colors.cyan,
            Colors.cyan,
          ]),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 80,),
            Header(),
            Expanded(child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )
              ),
              child: DiveCalcWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}