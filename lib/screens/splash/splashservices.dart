import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mprapp/screens/auth/login.dart';
import 'package:mprapp/screens/navigation.dart';

class SplashServices
{

  final auth = FirebaseAuth.instance;
  splash(context)
  {
    if(auth.currentUser!=null)
      {
        Timer(const Duration(seconds: 5),()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> Navigation())));
      }
    else
    {
      Timer(const Duration(seconds: 5),()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> login())));
    }
  }
}