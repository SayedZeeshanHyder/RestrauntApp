import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ImageService
{
  static void uploadBanner(context,Size size)
  async{

    final imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    final path = imageFile?.path;
    if(path != null)
      {
        showDialog(context: context, builder: (context){
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircularProgressIndicator(color: Colors.white,),
                  Text("Uploading Banner",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.055),)
                ],
              ),
            ),
          );
        });
        final reference = FirebaseStorage.instance.ref('special');
        final uploadFile = await reference.putFile(File(path));
        final downloadUrl = await uploadFile.ref.getDownloadURL();
        await FirebaseFirestore.instance.collection("Menu").doc('special').update({
          'imgUrl':downloadUrl
        });
        Navigator.pop(context);
      }
  }
}