import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mprapp/model/usermodel.dart';

class FirestoreServices
{
  static  Future<bool> addUser(String phoneNo,String dob,context)
  async {
    final deviceToken = await FirebaseMessaging.instance.getToken();
    final auth = FirebaseAuth.instance.currentUser;
    UserModel userModel = UserModel(deviceToken: deviceToken.toString(),uid: auth!.uid, phoneNo: int.parse(phoneNo), email: auth.email.toString(), dob: dob, orders: [], isGold: false, vouchers: [], prevOrders: [], friends: [], bookings: []);

    try {
      final addUserDb = await FirebaseFirestore.instance.collection("Users")
          .doc(userModel.uid)
          .set(userModel.toJson());

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
}