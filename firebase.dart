import 'package:firebase_core/firebase_core.dart'; 
import 'package:flutter/material.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'firebase_options.dart'; 
 
Future<void> main() async { 
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); 
  runApp(const MainApp()); 
} 
 
class MainApp extends StatelessWidget { 
  const MainApp({Key? key}) : super(key: key); 
  
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      home: Scaffold( 
        appBar: AppBar( 
          title: Text('Student Form'), 
        ), 
        body: Padding( 
          padding: const EdgeInsets.all(8.0), 
          child: StudentForm(), 
        ), 
      ), 
    ); 
  } 
} 
 
class StudentForm extends StatefulWidget { 
  @override 
  _StudentFormState createState() => _StudentFormState(); 
} 
 
class _StudentFormState extends State<StudentForm> { 
  final _formKey = GlobalKey<FormState>(); 
  final _nameController = TextEditingController(); 
  final _ageController = TextEditingController(); 
  final _emailController = TextEditingController(); 
 
  Future<void> addStudent() async { 
    CollectionReference students = 
        FirebaseFirestore.instance.collection('students'); 
    return students 
        .add({ 
          'name': _nameController.text, 
          'age': int.parse(_ageController.text), 
          'email': _emailController.text, 
        }) 
        .then((value) => print("Student Added")) 
        .catchError((error) => print("Failed to add student: $error")); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Column( 
      children: [ 
        Form( 
          key: _formKey, 
          child: Padding( 
            padding: const EdgeInsets.all(8.0), 
            child: Column( 
              children: <Widget>[ 
                Padding( 
                  padding: const EdgeInsets.all(8.0), 
                  child: TextFormField( 
                    controller: _nameController, 
                    decoration: InputDecoration(labelText: 'Name'), 
                    validator: (value) { 
                      if (value == null || value.isEmpty) { 
                        return 'Please enter a name'; 
                      } 
                      return null; 
                    }, 
                  ), 
                ), 
                Padding( 
                  padding: const EdgeInsets.all(8.0), 
                  child: TextFormField( 
                    controller: _ageController, 
                    decoration: InputDecoration(labelText: 'Age'), 
                    validator: (value) { 
                      if (value == null || value.isEmpty) { 
                        return 'Please enter an age'; 
                      } 

                      return null; 
                    }, 
                  ), 
                ), 
                Padding( 
                  padding: const EdgeInsets.all(8.0), 
                  child: TextFormField( 
                    controller: _emailController, 
                    decoration: InputDecoration(labelText: 'Email'), 
                    validator: (value) { 
                      if (value == null || value.isEmpty) { 
                        return 'Please enter an email'; 
                      } 
                      return null; 
                    }, 
                  ), 
                ), 
                Padding( 
                  padding: const EdgeInsets.all(8.0), 
                  child: ElevatedButton( 
                    onPressed: () { 
                      if (_formKey.currentState!.validate()) { 
                        addStudent(); 
                        ScaffoldMessenger.of(context).showSnackBar( 
                            SnackBar(content: Text('Processing Data'))); 
                      } 
                    }, 
                    child: Text('Submit'), 
                  ), 
                ), 
              ], 
            ), 
          ), 
        ), 
        Expanded( 
          child: StreamBuilder<QuerySnapshot>( 
            stream: 
                FirebaseFirestore.instance.collection('students').snapshots(), 
            builder: 
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) { 
              if (snapshot.hasError) { 
                return Text('Something went wrong'); 
              } 
 
              if (snapshot.connectionState == ConnectionState.waiting) { 
                return Text("Loading"); 
              } 
 
              return ListView( 
                children: snapshot.data!.docs.map((DocumentSnapshot document) { 
                  Map<String, dynamic> data = 
                      document.data() as Map<String, dynamic>; 
                  return ListTile( 
                    title: Text(data['name']), 
                    subtitle: 
                        Text('Age: ${data['age']}, Email: ${data['email']}'), 
                  ); 
                }).toList(), 
              ); 
            }, 
          ), 
        ), 
      ], 
    ); 
