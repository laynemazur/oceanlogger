import 'package:flutter/material.dart';
import '../components/Header.dart';
import '../components/DiveCalcWrapper.dart';

class DiveCalcPage extends StatelessWidget {
  const DiveCalcPage({super.key});

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
              child: DiveCalcWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}
