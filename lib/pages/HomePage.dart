import 'package:flutter/material.dart';

//Tester home page for Login API success
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(
        child: Text('Username and Password were correct.'),
      ),
    );
  }
}