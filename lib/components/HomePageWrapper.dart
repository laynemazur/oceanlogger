import 'package:flutter/material.dart';
import 'package:oceanlogger/buttons/DiveCalcButton.dart';
import '../pages/AddLogPage.dart';
import '../pages/DiveCalcPage.dart';

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({Key? key}) : super(key: key);

  @override
  State<HomePageWrapper> createState() => _HomePageWrapper();
}

class _HomePageWrapper extends State<HomePageWrapper> {
  int _selectedIndex = 1;

  static const List<Widget> _pages = <Widget>[
    AddLogPage(),
    // where list of logs will be
    Icon(
      Icons.home,
      size: 150,
    ),
    DiveCalcPage(),
    // Icon(
    //   Icons.chat,
    //   size: 150,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      // has a dandy back button built in, takes up space though
      //title: const Text('ScubaLogger'),
      //),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Log',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Dive Calculator',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.chat),
          //   label: 'Chats',
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
