import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mprapp/screens/auth/login.dart';
import 'package:mprapp/screens/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mprapp/screens/home/home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restraunt App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: auth.currentUser!=null ? Home() : login(),
    );
  }
}