import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprapp/screens/auth/login.dart';
import 'package:mprapp/screens/qr/qrscanner.dart';
import 'package:mprapp/services/imageservice.dart';

class AdminHome extends StatelessWidget
{
  final auth = FirebaseAuth.instance;
  final bookingCollection = FirebaseFirestore.instance.collection("Booking");
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

      floatingActionButton: FloatingActionButton(
        onPressed: startScan,
        child: Icon(Icons.qr_code_scanner),
      ),
    );
  }

  startScan()
  async{
    try {
      final scanQr = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if(scanQr.isNotEmpty) {
        checkIn(scanQr);
      }
      else{
        Get.snackbar("Error Occured", "Invalid QR Code Detected");
      }
    }catch(e) {
      print("Error: ${e.toString()}");
    }

  }

  checkIn(String bookingId)
  {
    bookingCollection.doc(bookingId).update({
      "isChecked":true,
    });
  }
}