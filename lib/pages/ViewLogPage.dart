import 'package:flutter/material.dart';

class ViewLogPage extends StatelessWidget {
  const ViewLogPage({super.key, required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    int taps = 0;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/back.png'),
          onPressed: () => Navigator.of(context).pop(),
          iconSize: 50,
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/edit.png'),
            onPressed: () => {
              showDialog(
               context: context,
               builder: (BuildContext context) {
                 taps += 1;

                 return (taps >= 10 ?
                 AlertDialog(title: const Text("Here's Sharky!"), content: Image.asset('assets/images/shark.png')) :
                 const AlertDialog(title: Text("This doesn't do anything."),));
               }
              )
            },
            iconSize: 50,
          ),
          // const SizedBox(height: 25, width: 25,),
        ],
        leadingWidth: 65,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Date: ${data["date"]}", style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF0089ED),
                    borderRadius: BorderRadius.all(Radius.circular(9.5))
                ),
                height: 100,
                width: 385,
                child: Column(
                  children: [
                    const SizedBox(height: 17.5,),
                    Text(data["title"], style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32
                    ),),
                    const SizedBox(height: 5,),
                    Text(data["location"], style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14
                    ),)
                  ],
                )
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100,20,10,0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.all(Radius.circular(9.5))
                      ),
                      constraints: const BoxConstraints(minHeight: 100),
                      width: 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20),
                            child: Text("${data["diveTime"]} Min", style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF0089ED),
                            ),),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text("Dive Time", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,20,10,0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.all(Radius.circular(9.5))
                      ),
                      constraints: const BoxConstraints(minHeight: 100),
                      width: 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20),
                            child: Text("${data["maxDepth"]} M", style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF0089ED),
                            ),),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text("Dive Depth", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100,20,10,0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.all(Radius.circular(9.5))
                      ),
                      constraints: const BoxConstraints(minHeight: 100),
                      width: 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20),
                            child: Text("${data["temperature"]} F", style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF0089ED),
                            ),),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text("Temp", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,20,10,0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.all(Radius.circular(9.5))
                      ),
                      constraints: const BoxConstraints(minHeight: 100),
                      width: 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20),
                            child: Text("${data["visibility"]} M", style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF0089ED),
                            ),),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text("Visibility", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100,20,10,0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.all(Radius.circular(9.5))
                      ),
                      constraints: const BoxConstraints(minHeight: 100),
                      width: 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20),
                            child: Text("${data["startAirPressure"]} BARS", style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color(0xFF0089ED),
                            ),),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text("Starting Pressure", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,20,10,0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.all(Radius.circular(9.5))
                      ),
                      constraints: const BoxConstraints(minHeight: 100),
                      width: 100,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20),
                            child: Text("${data["endAirPressure"]} BARS", style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color(0xFF0089ED),
                            ),),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text("Ending Pressure", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.all(Radius.circular(9.5))
                  ),
                  constraints: const BoxConstraints(minHeight: 45),
                  width: 220,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("Dive Computer", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5,0,5,5),
                        child: Text("${data["diveComputer"]}", style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF0089ED),
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.all(Radius.circular(9.5))
                  ),
                  constraints: const BoxConstraints(minHeight: 60),
                  width: 220,
                  padding: const EdgeInsets.all(5),
                  // child: Text("Notes:\n${data["notes"]}"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Notes:", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),),
                      Text("${data["notes"]}"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
