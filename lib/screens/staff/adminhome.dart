import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mprapp/screens/auth/login.dart';

class AdminHome extends StatelessWidget
{
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("Admin Home"),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Get.off(()=> login());
            });
          }, icon: Icon(Icons.logout),),
        ],
      ),
    );
  }

}