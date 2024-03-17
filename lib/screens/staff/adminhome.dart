import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprapp/screens/auth/login.dart';
import 'package:mprapp/services/imageservice.dart';

class AdminHome extends StatelessWidget
{
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Admin Home"),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Get.off(()=> login());
            });
          }, icon: Icon(Icons.logout),),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.02,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Menu').doc('special').snapshots(),
                builder: (context, snapshot) {

                  if(snapshot.connectionState == ConnectionState.waiting)
                    {
                      return Container(
                        width: size.width*0.93,
                        height: size.height*0.25,
                        child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.brown,
                            ),
                        ),
                      );
                    }
                  final imgUrl = snapshot.data!.data()!['imgUrl'];
                  return Container(
                    width: size.width*0.93,
                    height: size.height*0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width*0.06),
                      image: DecorationImage(image: NetworkImage(imgUrl,),fit: BoxFit.cover),
                    ),
                  );
                }
              ),

              SizedBox(
                height: size.height*0.015,
              ),
              InkWell(
                onTap: (){
                  ImageService.uploadBanner(context,size);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: size.width*0.75,
                  height: size.height*0.056,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(size.width*0.03),
                  ),
                  child: Text("Change Banner",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.045),),
                ),
              ),

              SizedBox(
                height: size.height*0.01,
              ),
              Divider(
                color: Colors.brown,
                thickness: size.width*0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }

}