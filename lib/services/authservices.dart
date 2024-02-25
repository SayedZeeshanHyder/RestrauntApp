import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mprapp/screens/auth/login.dart';

class AuthServices
{
  static final auth = FirebaseAuth.instance;

  static Future<bool> signUpUser(String email,String password,String name,context)
  async{
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      await user!.updateDisplayName(name);
      return true;
    }catch(e)
    {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.yellowAccent.shade700,
          content: Text(
            e.toString(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      );
      return false;
    }
  }

  static signOut(context)
  {
    auth.signOut().then((value){
      Get.off(()=>login(),transition: Transition.cupertino);
    });
  }
}