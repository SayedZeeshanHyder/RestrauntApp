import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mprapp/screens/qr/showqr.dart';

class MyBookings extends StatelessWidget
{
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        title: Text("My Bookings"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").doc(auth.currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          final data = snapshot.data!.data();
          List listOfBooking = data!["bookings"];
          return ListView.builder(itemCount: listOfBooking.length,itemBuilder: (contex,index){
            final bookingInfo = listOfBooking[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(size.width*0.1),),
                      ),
                      width: size.width*0.2,
                      child: Icon(Icons.emoji_food_beverage),
                    ),
                    SizedBox(
                      width: size.width*0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title of the Meal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.05),),
                        SizedBox(width: size.width*0.5,child: Text("Id : ${bookingInfo["bookingId"]}",overflow: TextOverflow.ellipsis,)),
                        const Text("3 people"),
                        const Text("From 3 to 5 P.M.")
                      ],
                    ),
                    Spacer(),
                    IconButton(onPressed: (){
                      print(bookingInfo["bookingId"]);
                      Get.to(()=>ShowQr(bookingId: bookingInfo["bookingId"],));
                    }, icon: Icon(Icons.arrow_forward),),
                  ],
                ),
              ),
            );
          });
        }
      )
    );
  }

}