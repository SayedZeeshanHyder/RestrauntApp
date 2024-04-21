import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
          if(data!["isCheckedIn"])
            {
              if(data["isCheckedOut"])
                {
                  return Center(
                    child: Column(
                      children: [
                        Spacer(),
                        RatingBar.builder(
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          updateOnDrag: true,
                          unratedColor: Colors.grey.shade300,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.brown,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        Spacer(),
                        if(!data["ratingDone"])
                          Row(
                            children: [
                              SizedBox(
                                width: 3,
                              ),
                              Expanded(child: Container(
                                padding: EdgeInsets.all(15),
                                alignment: Alignment.center,
                                child: Text("Skip",style: TextStyle(color: Colors.white),),
                              ),),
                              SizedBox(
                                width: 3,
                              ),
                              Expanded(child: Container(
                                padding: EdgeInsets.all(15),
                                color: Colors.brown,
                                alignment: Alignment.center,
                                child: Text("Submit",style: TextStyle(color: Colors.white),),
                              ),),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          ),
                      ],
                    ),
                  );
                }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.brown,
                          radius: size.width*0.15,
                          child: Icon(Icons.check,color: Colors.white,size : size.width*0.2),
                        ),
                        SizedBox(height: size.height*0.02),
                        const Text("Successfully Checked In"),
                      ],
                    ),
                    Column(
                      children: [
                        QrImageView(data: bookingId,size: size.width*0.6,),
                        const Text("Scan the Qr Code to Check Out"),
                      ],
                    ),
                  ],
                ),
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