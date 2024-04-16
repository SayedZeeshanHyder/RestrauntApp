import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprapp/apivariables.dart';
import 'package:mprapp/screens/orders/mybookings.dart';
import 'package:mprapp/screens/profile/settings.dart';
import 'package:url_launcher/url_launcher.dart';

class Me extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    print(auth.currentUser!.uid);

    Size size = MediaQuery.of(context).size;

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          List orders;
          List vouchers;
          List friends;
          bool isGold;
          if (snapshot.connectionState == ConnectionState.waiting) {
            orders = [];
            vouchers = [];
            friends = [];
            return Center(
              child: CircularProgressIndicator(
                color: Colors.brown.shade900,
              ),
            );
          } else {
            final data = snapshot.data!.data();
            orders = data!['orders'];
            vouchers = data['vouchers'];
            friends = data['friends'];
            isGold = data['isGold'];
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                SizedBox(
                  width: size.width,
                  child: Card(
                    color: Colors.brown,
                    elevation: 15,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height*0.015),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: size.width * 0.175,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(height: size.height*0.025,),
                          Text(
                            auth.currentUser!.displayName.toString(),
                            style: GoogleFonts.roboto(
                                fontSize: size.width * 0.08,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 15,
                  color: Colors.brown,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height*0.015),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              orders.length.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: size.width * 0.08,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Orders",
                              style: GoogleFonts.roboto(
                                  fontSize: size.width * 0.04,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              vouchers.length.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: size.width * 0.08,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Vouchers",
                              style: GoogleFonts.roboto(
                                  fontSize: size.width * 0.04,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              friends.length.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: size.width * 0.08,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Friends",
                              style: GoogleFonts.roboto(
                                  fontSize: size.width * 0.04,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


                Card(
                  color: Colors.brown,
                  elevation: 15,
                  child: ListTile(
                    leading: Icon(Icons.headset_mic_outlined,color: Colors.white,),
                    title: Text(
                      "Complaint",
                      style: GoogleFonts.roboto(
                          fontSize: size.width * 0.05,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Card(
                  color: Colors.brown,
                  elevation: 15,
                  child: ListTile(
                    leading: Icon(Icons.report,color: Colors.white,),
                    title: Text(
                      "Report",
                      style: GoogleFonts.roboto(
                          fontSize: size.width * 0.05,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Card(
                  color: Colors.brown,
                  elevation: 15,
                  child: ListTile(
                    leading: Icon(Icons.help,color: Colors.white,),
                    title: Text(
                      "Help",
                      style: GoogleFonts.roboto(
                          fontSize: size.width * 0.05,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Card(
                  color: Colors.brown,
                  elevation: 15,
                  child: ListTile(
                    onTap: (){
                      Get.to(()=> MyBookings());
                    },
                    leading: Icon(Icons.table_bar_rounded,color: Colors.white,),
                    title: Text(
                      "My Bookings",
                      style: GoogleFonts.roboto(
                          fontSize: size.width * 0.05,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),


                Card(
                  color: Colors.brown,
                  elevation: 15,
                  child: ListTile(
                    onTap: (){
                      launchUrl(Uri.parse(ApiVariables.webUrl),);
                    },
                    leading: Icon(Icons.web,color: Colors.white,),
                    title: Text(
                      "Our Website",
                      style: GoogleFonts.roboto(
                          fontSize: size.width * 0.05,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: (){
                    Get.to(()=>SettingsScreen(),transition: Transition.rightToLeft);
                  },
                  child: Card(
                    color: Colors.brown,
                    elevation: 15,
                    child: ListTile(
                      leading: Icon(Icons.settings,color: Colors.white,),
                      title: Text(
                        "Settings",
                        style: GoogleFonts.roboto(
                            fontSize: size.width * 0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                Card(
                  color: Colors.brown,
                  elevation: 15,
                  child: ListTile(
                    leading: Icon(Icons.web,color: Colors.white,),
                    title: Text(
                      "KYC (Know your Chef)",
                      style: GoogleFonts.roboto(
                          fontSize: size.width * 0.05,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(
                  height: size.height*0.04,
                ),
              ],
            ),
          );
        });
  }
}
