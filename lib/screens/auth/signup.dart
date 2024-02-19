import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprapp/controllerfiles/loadingcontroller.dart';
import 'package:mprapp/screens/home/home.dart';
import 'package:mprapp/services/emailservice.dart';
import 'package:mprapp/services/notificationservices.dart';

class SignUp extends StatelessWidget
{

  final messaging = FirebaseMessaging.instance;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phonenoController = TextEditingController();
  final dobController = TextEditingController();
  final loadingController = Get.put(LoadingController());


  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        elevation: null,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height*0.04,),
              Text("Sign up for free account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.05),),
              SizedBox(height: size.height*0.06,),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: size.width*0.035),
                width: size.width*0.8,
                height: size.height*0.07,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(size.width*0.08),
                ),
                child: TextField(
                  style: GoogleFonts.roboto(color: Colors.white),
                  controller : usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: GoogleFonts.roboto(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height*0.01,),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: size.width*0.035),
                width: size.width*0.8,
                height: size.height*0.07,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(size.width*0.08),
                ),
                child: TextField(
                  style: GoogleFonts.roboto(color: Colors.white),
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: GoogleFonts.roboto(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height*0.01,),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: size.width*0.035),
                width: size.width*0.8,
                height: size.height*0.07,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(size.width*0.08),
                ),
                child: TextField(
                  style: GoogleFonts.roboto(color: Colors.white),
                  keyboardType: TextInputType.number,
                  controller: phonenoController,
                    decoration: InputDecoration(
                      labelText: "Phone number",
                      labelStyle: GoogleFonts.roboto(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                ),
              ),
              SizedBox(height: size.height*0.01,),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: size.width*0.035),
                width: size.width*0.8,
                height: size.height*0.07,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(size.width*0.08),
                ),
                child: TextField(
                  style: GoogleFonts.roboto(color: Colors.white),
                  controller: dobController,
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.roboto(color: Colors.white),
                      labelText: "Date of Birth",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                ),
              ),
              SizedBox(height: size.height*0.01,),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: size.width*0.035),
                width: size.width*0.8,
                height: size.height*0.07,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(size.width*0.08),
                ),
                child: TextField(
                  style: GoogleFonts.roboto(color: Colors.white),
                  controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: GoogleFonts.roboto(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                ),
              ),
              SizedBox(height: size.height*0.05,),
              InkWell(

                splashFactory:NoSplash.splashFactory,

                onTap: () async{

                  loadingController.loadingStarted();

                  String snackbarmessage="";
                  if(usernameController.text.isEmpty){
                    snackbarmessage = "Please Enter Username";
                  }
                  else if(passwordController.text.isEmpty)
                    {
                      snackbarmessage = "Please Enter Password";
                    }
                  else if(phonenoController.text.isEmpty)
                    {
                      snackbarmessage = "Please Enter Phone Number";
                    }
                  else if(phonenoController.text.length != 10)
                    {
                      snackbarmessage = "Invalid Length of Phone Number";
                    }
                  else if(dobController.text.isEmpty)
                    {
                      snackbarmessage = "Please Enter Date of Birth";
                    }
                  else if(emailController.text.isEmpty)
                    {
                      snackbarmessage = "Please Enter Email";
                    }
                  else
                    {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) async{

                        value.user!.updateDisplayName(usernameController.text).then((value)async{
                          loadingController.loadingCompleted();
                          Navigator.pop(context);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.yellowAccent.shade700,content: const Text("Account Created Successfully",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),),);

                          //Email Api
                          await EmailServices.sendEmail(emailController.text);

                          //Notification Api
                          await NotiServices.notificationApiCall(usernameController.text);
                        });

                      }).onError((error, stackTrace) {
                        snackbarmessage = error.toString();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.yellowAccent.shade700,content: Text(snackbarmessage,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),),);
                        loadingController.loadingCompleted();
                      });
                    }

                  if(snackbarmessage!="")
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.yellowAccent.shade700,content: Text(snackbarmessage,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),),);
                    snackbarmessage = "";
                  }

                },
                child: Obx(
                  ()=> Container(
                    alignment: Alignment.center,
                    width: size.width*0.8,
                    height: size.height*0.06,
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(size.width*0.06)
                    ),
                    child: loadingController.isLoading.value ? Padding(
                      padding: EdgeInsets.all(size.width*0.03),
                      child: const CircularProgressIndicator(color: Colors.white,),
                    ) : Text("Signup",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.04,color: Colors.white),),),
                ),
              ),
              SizedBox(height: size.height*0.17,),
              const Text("By clicking on SignUp you agree to the following Terms & Conditions",textAlign: TextAlign.center,),
              SizedBox(height: size.height*0.03,),
            ],
          ),
        ),
      ),
    );
  }

}