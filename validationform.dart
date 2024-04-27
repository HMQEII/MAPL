import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          title: Text('Royal.uk'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 236, 124, 208),
        ),
        body: MyForm(),
        ),
    );
}
}
class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key:key);
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  @override 
  Widget build (BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter thy name',
              labelText: 'name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Field cannot be left empty';
              }
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: 'Enter thy PhNo',
              labelText: 'PhNo',
            ),
            validator: (value) {
              if (value!.isEmpty || value.length < 10 || int.tryParse(value)==null)  {
                return 'Enter a valid phone number';
              }
            },
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(child: const Text('Submit'),
            onPressed: (){
              if(_formKey.currentState!.validate())
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Submitted'),),
                );
              }
            },),
          )
        ],
      ),
    );
  }
}
