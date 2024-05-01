import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    const MaterialApp(
      title:'Navigation Basics',
      home: FirstRoute(),
    )
  );
}

class FirstRoute extends StatelessWidget {
  const FirstRoute ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to the First Route',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const SecondRoute()), 
                  );
                },
                child: const Text('Open Second Route'),),
            ],
          ),
          ),
    );
}
}

class SecondRoute extends StatelessWidget {
  const SecondRoute ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          const Text(
            'You are now on the second route',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            child: const Text('Go Back to First Route'),),
            const SizedBox(height: 20),
            Image.network(
              'https://www.google.com/fafav234qwa.jpg',
              width: 200,
            ),
            
        ],
      ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                ),
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
