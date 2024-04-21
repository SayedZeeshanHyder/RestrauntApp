import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../controllerfiles/tablecontroller.dart';
import 'mybookings.dart';

class OrderInfo extends StatelessWidget
{
  final tableController = Get.put(TableController());
  var uuid = const Uuid();
  final userCollection = FirebaseFirestore.instance.collection("Users");
  final bookingCollection = FirebaseFirestore.instance.collection("Booking");
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context)
  {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("BookingInfo"),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width*0.9,
              height: size.height*0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white
                ),
                onPressed: ()async{
                  final bookId = uuid.v4();
                  final get = await userCollection.doc(auth.currentUser!.uid).get();
                  List listOfBookings = get.data()!["bookings"];
                  listOfBookings.add({
                    "bookingId" : bookId,
                    "user":auth.currentUser!.uid,
                    "persons": tableController.val.value,
                    "dateTime": DateTime.now(),
                  });
                  await userCollection.doc(auth.currentUser!.uid).update({
                    "bookings":listOfBookings
                  });

                  await bookingCollection.doc(bookId).set({
                    "userId":auth.currentUser!.uid,
                    "isCheckedOut":false,
                    "isCheckedIn":false,
                    "ratingDone": false,
                  });
                  Get.to(()=>MyBookings());
                }, child: const Text("Submit Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}