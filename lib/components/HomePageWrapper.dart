import 'package:flutter/material.dart';
import 'package:oceanlogger/buttons/DiveCalcButton.dart';
import '../pages/AddLogPage.dart';
import '../pages/DiveCalcPage.dart';
import '../database/Backend.dart';
import '../pages/ViewLogPage.dart';

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({Key? key}) : super(key: key);

  @override
  State<HomePageWrapper> createState() => _HomePageWrapper();
}

class _HomePageWrapper extends State<HomePageWrapper> {
  int _selectedIndex = 1;

  // these tell navbar where to go when tapped
  static const List<Widget> _pages = <Widget>[
    AddLogPage(),
    // where list of logs will be
    // moved here from body center
    SingleChildScrollView(
      child: Column(
        children: <Widget>[
          DisplayData()
        ],
      ),
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
      // APPBAR CAN WORK AS THE TOP PART FOR HOMEPAGE PROBABLY
      //appBar: AppBar(
      // has a dandy back button built in, takes up space though
      //title: const Text('ScubaLogger'),
      //),
      body: Center(
        // reverted changes, and moved above into _HomePageWrapper
        // class
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

// Call DisplayData() to display all the logs.
class DisplayData extends StatefulWidget {
  const DisplayData({super.key});

  @override
  State<DisplayData> createState() => _DisplayData();
}

class _DisplayData extends State<DisplayData> {

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      // style: Theme.of(context).textTheme.displaySmall!,
      style: const TextStyle(color: Colors.black),
      textAlign: TextAlign.center,
      child: FutureBuilder<dynamic>(
        future: ConnectBackend.searchDiveLog("", "", "", ""),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  return InkWell(
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewLogPage(data: snapshot.data[index])),
                        );
                      }, // Handle your callback
                      child: Table(
                        border: TableBorder.symmetric(outside: BorderSide(color: Colors.black)),
                        children: [
                          TableRow(
                              children: [
                                // Modify Title Here.
                                Container(
                                  child: Text(snapshot.data[index]["title"], textAlign: TextAlign.left, style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),),
                                  padding: EdgeInsets.all(16.0),
                                ),
                                // Modify Date Here.
                                Container(
                                  child: Text(snapshot.data[index]["date"], textAlign: TextAlign.right, style: TextStyle(
                                      color: Color(0xFFa1a1a1)
                                  ),),
                                  padding: EdgeInsets.all(16.0),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                Container(
                                  // Modify Location Here.
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(Radius.circular(9.5))
                                    ),
                                    width: 85,
                                    child: Text(snapshot.data[index]["location"], style: TextStyle(color: Colors.white),),
                                    padding: EdgeInsets.all(3.5),
                                  ),
                                  padding: EdgeInsets.all(16),
                                  alignment: Alignment.centerLeft,
                                ),
                                Container(
                                  child: Text(""),
                                  padding: EdgeInsets.all(12.0),
                                ),
                              ]
                          ),
                        ],
                      )
                  );
                },
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting data...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
