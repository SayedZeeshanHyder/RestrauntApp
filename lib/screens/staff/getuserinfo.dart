import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetUserInfo extends StatelessWidget
{

  final userId;
  GetUserInfo({required this.userId});
  final firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Information"),
      ),
      body: StreamBuilder(
        stream: firestore.collection("Users").doc(userId).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
            {
              return const Center(child: CircularProgressIndicator(color: Colors.brown));
            }
          print(snapshot.data!.data());
          return const Text("Hello");
        }
      ),
    );
  }
}