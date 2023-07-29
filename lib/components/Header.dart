import 'package:flutter/material.dart';

//General header, this can be deleted/altered if need be
class Header extends StatelessWidget{
  Header({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset("assets/images/006-shark-1.png",
                width: 100 ),
          ),
          Center(
            child: RichText(
              text: const TextSpan(
                text: 'Scuba',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Logger',
                      style: TextStyle(color: Color.fromRGBO(0,137,237,1))
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
