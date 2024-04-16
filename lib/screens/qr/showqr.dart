import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
class ShowQr extends StatelessWidget
{
  final bookingId;
  ShowQr({required this.bookingId});
  @override
  Widget build(BuildContext context)
  {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Booking").doc(bookingId).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          final data = snapshot.data!.data();
          if(data!["isChecked"])
            {
              Timer(const Duration(seconds: 5),()=>Get.back());
              return Center(
                child: CircleAvatar(radius: size.width*0.15,child: Icon(Icons.check),),
              );
            }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                QrImageView(data: bookingId,size: size.width*0.6,),
                const Text("Scan the Qr Code to Check In"),
              ],
            ),
          );
        }
      ),
    );
  }
}