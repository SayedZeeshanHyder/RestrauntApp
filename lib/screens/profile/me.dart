import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprapp/screens/home/premiumscreen.dart';
import 'package:mprapp/services/authservices.dart';

class Me extends StatelessWidget
{

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    print(auth.currentUser!.uid);

    Size size = MediaQuery.of(context).size;

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Users").doc(auth.currentUser!.uid).snapshots(),
      builder: (context, snapshot) {

        List orders;
        List vouchers;
        List friends;
        bool isGold;
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          orders=[];
          vouchers=[];
          friends=[];
          return Center(
            child: CircularProgressIndicator(
              color: Colors.brown.shade900,
            ),
          );
        }
        else {
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
                height: size.height*0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: size.width*0.08,
                    backgroundColor: Colors.grey.shade100,
                    child: auth.currentUser?.photoURL != null ? Image.network(auth.currentUser!.photoURL.toString()) : Icon(Icons.photo),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(vouchers.length.toString(),style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: size.width*0.06),),
                      Text("Vouchers")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(orders.length.toString(),style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: size.width*0.06),),
                      Text("Orders")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(friends.length.toString(),style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: size.width*0.06),),
                      Text("Friends"),
                    ],
                  ),

                ],
              ),
              SizedBox(
                height: size.height*0.05,
              ),
              InkWell(
                onTap: (){
                  if(!isGold)
                    {
                      Get.to(()=>PremiumScreen(),transition: Transition.downToUp);
                    }
                },
                child: Container(
                  width: size.width*0.9,
                  height: size.height*0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width*0.07),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow.shade600,
                        Colors.white,
                        Colors.yellow.shade600,
                        Colors.white,
                        Colors.yellow.shade600,
                        Colors.white,
                        Colors.yellow.shade600,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(isGold ? "Gold Member" : "Become a Gold Member",style: GoogleFonts.roboto(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: size.width*0.05),),
                      if(isGold)
                        Icon(Icons.check,color: Colors.purple,)
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: size.height*0.04,
              ),
              Divider(color: Colors.brown.shade900,),
              ListTile(
                title: Text("My Vouchers",style: GoogleFonts.roboto(fontSize: size.width*0.05),),
                trailing: Icon(Icons.redeem),
              ),
              Divider(color: Colors.brown.shade900,),
              ListTile(
                title: Text("Previous Orders",style: GoogleFonts.roboto(fontSize: size.width*0.05),),
                trailing: Icon(Icons.food_bank),
              ),
              Divider(color: Colors.brown.shade900,),
              ListTile(
                title: Text("Settings",style: GoogleFonts.roboto(fontSize: size.width*0.05),),
                trailing: Icon(Icons.settings),
              ),
              Divider(color: Colors.brown.shade900,),
              ListTile(
                title: Text("Help",style: GoogleFonts.roboto(fontSize: size.width*0.05),),
                trailing: Icon(Icons.help),
              ),
              Divider(color: Colors.brown.shade900,),
              ListTile(
                onTap: (){
                  AuthServices.signOut(context);
                },
                title: Text("Log Out",style: GoogleFonts.roboto(fontSize: size.width*0.05),),
                trailing: Icon(Icons.logout),
              ),
              Divider(color: Colors.brown.shade900,),
            ],
          ),
        );
      }
    );
  }

}