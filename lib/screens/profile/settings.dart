import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprapp/screens/auth/login.dart';

class SettingsScreen extends StatelessWidget
{

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        title: Text("Settings"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.02,vertical: size.height*0.01),
              child: Text("Order Settings",style: GoogleFonts.roboto(fontSize: size.width*0.04,color: Colors.brown),),
            ),
            ListTile(
              tileColor: Colors.brown,
              leading: Icon(Icons.shopping_bag,color: Colors.white,size: size.width*0.06,),
              title: Text("Show Order Details",style: GoogleFonts.roboto(fontSize: size.width*0.04,color: Colors.white),),
            ),
            ListTile(
              tileColor: Colors.brown,
              leading: Icon(Icons.email,color: Colors.white,size: size.width*0.06,),
              title: Text("Recieve Email after Each Order",style: GoogleFonts.roboto(fontSize: size.width*0.04,color: Colors.white),),
            ),
            ListTile(
              tileColor: Colors.brown,
              leading: Icon(Icons.notifications,color: Colors.white,size: size.width*0.06,),
              title: Text("Recieve Notifications after Each Order",style: GoogleFonts.roboto(fontSize: size.width*0.04,color: Colors.white),),
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.02,vertical: size.height*0.01),
              child: Text("Account Settings",style: GoogleFonts.roboto(fontSize: size.width*0.04,color: Colors.brown),),
            ),
            ListTile(
              tileColor: Colors.brown,
              leading: Icon(Icons.person,color: Colors.white,size: size.width*0.06,),
              title: Text(auth.currentUser!.displayName.toString(),style: GoogleFonts.roboto(fontSize: size.width*0.04,color: Colors.white),),
            ),
            ListTile(
              tileColor: Colors.brown,
              leading: Icon(Icons.edit,color: Colors.white,size: size.width*0.06,),
              title: Text("Edit Account Details",style: GoogleFonts.roboto(fontSize: size.width*0.04,color: Colors.white),),
            ),
            ListTile(
              tileColor: Colors.brown,
              leading: Icon(Icons.history,color: Colors.white,size: size.width*0.06,),
              title: Text("View Account History",style: GoogleFonts.roboto(fontSize: size.width*0.04,color: Colors.white),),
            ),
            ListTile(
              onTap: (){
                auth.signOut().then((value){
                  Get.back();
                  Get.off(()=> login(),transition: Transition.cupertino);
                });
              },
              tileColor: Colors.brown,
              leading: Icon(Icons.logout,color: Colors.white,size: size.width*0.06,),
              title: Text("Log Out",style: GoogleFonts.roboto(fontSize: size.width*0.04,color: Colors.white),),
            ),


            SizedBox(
              height: size.height*0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("App Version",style: GoogleFonts.roboto(fontSize: size.width*0.04,color: Colors.brown),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("v1.0.1",style: GoogleFonts.roboto(fontSize: size.width*0.04,color: Colors.brown),),
              ],
            ),
          ],
        ),
      ),
    );
  }

}