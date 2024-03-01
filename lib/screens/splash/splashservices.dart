import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mprapp/screens/auth/login.dart';
import 'package:mprapp/screens/navigation.dart';
import 'package:mprapp/screens/staff/adminhome.dart';

class SplashServices {
  final auth = FirebaseAuth.instance;
  splash(context) {
    if (auth.currentUser != null) {
      if(auth.currentUser!.email == "staff@gmail.com"){
        Timer(
            const Duration(seconds: 5),
                () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => AdminHome())));
      }
      else {
        Timer(
            const Duration(seconds: 5),
                () =>
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Navigation())));
      }
    } else {
      Timer(
          const Duration(seconds: 5),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => login())));
    }
  }
}
