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
      home:Scaffold(
        appBar: AppBar(
          title: Text('Widgets Exhibition'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 100,
                  color: Colors.blue,
                  child: Center(child: Text('Header'),)
                ),
                SizedBox(height:20),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                      child: Center(child: Text('Widget 1'),),
                    ),

                  ],
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  }),
                  ),
                  SizedBox(height: 20),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 8, mainAxisSpacing: 6,
                    children: List.generate(6,(index) {
                      return Container(
                        color: Colors.lightBlueAccent,
                        child: Center(child: Text('Grid Item $index'),),
                      );
                    }),
                  ),
                  SizedBox(height: 20,),
                  Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          TableCell(child: Center(child:Text('R1,C1'))),
                          TableCell(child: Center(child:Text('R1,C2'))),
                          TableCell(child: Center(child:Text('R1,C3'))),
                        ]
                      ),
                    ],
                  )
              ]
            )
          )
        )
      )
    );
}
}

