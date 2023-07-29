import 'package:flutter/material.dart';

class ViewLogPage extends StatelessWidget {
  const ViewLogPage({super.key, required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/back.png'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: 75,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(data["title"], style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(9.5))
                ),
                height: 100,
                width: 375,
                alignment: Alignment.center,
                child: Text("WORK IN PROGRESS"),
              ),
            ],
          ),
        ),
      )
    );
  }
}