import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Royal.uk',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Sans-Serif',
          ),),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 236, 124, 208),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text('Enter thy name',
             style: TextStyle(
              fontFamily: 'Sans-Serif',
              fontSize: 20,
              ),
              textAlign: TextAlign.left,
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Elizabeth Alexandra Mary',
                ),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
             Text('Enter thy designation',
             style: TextStyle(
              fontFamily: 'Sans-Serif',
              fontSize: 20,
              ),
              textAlign: TextAlign.left,
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Queen',
                ),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Center(
                child:TextButton(
                onPressed: () {
                   return null;
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                ),
                child: Text('Submit',
                style: TextStyle(
                  fontSize: 20,
                ),
                ),
           
                
                ), ),
              
            ],),
          ),
        ),
    );
}
}

