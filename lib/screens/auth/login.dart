import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprapp/controllerfiles/loadingcontroller.dart';
import 'package:mprapp/screens/auth/signup.dart';
import 'package:get/get.dart';
import 'package:mprapp/screens/staff/adminhome.dart';
import '../../others/images.dart';
import '../navigation.dart';

class login extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loadingController = Get.put(LoadingController());
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              alignment: Alignment.center,
              width: size.width,
              height: size.height * 0.55,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Images.loginImg), fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.brown.shade100,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(size.width * 0.1))),
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Spacer(
                        flex: 3,
                      ),
                      Text(
                        "Login to your Account",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.05),
                      ),
                      Spacer(
                        flex: 7,
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.035),
                    width: size.width * 0.8,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(size.width * 0.08),
                    ),
                    child: TextField(
                        style: GoogleFonts.roboto(color: Colors.white),
                        controller: emailController,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.roboto(color: Colors.white),
                          labelText: "Email",
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.035),
                    width: size.width * 0.8,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(size.width * 0.08),
                    ),
                    child: TextField(
                      style: GoogleFonts.roboto(color: Colors.white),
                      controller: passwordController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: GoogleFonts.roboto(color: Colors.white),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const Row(
                    children: [
                      Spacer(
                        flex: 7,
                      ),
                      Text("Forgot Password?"),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Obx(
                    () => InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        loadingController.loadingStarted();
                        String snackbarmessage = "";
                        if (emailController.text.isEmpty) {
                          snackbarmessage = "Please Enter Email";
                        } else if (passwordController.text.isEmpty) {
                          snackbarmessage = "Please Enter Password";
                        } else {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            loadingController.loadingCompleted();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Navigation()));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.brown,
                                content: Text(
                                  "Welcome ${value.user!.displayName}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                          }).onError((error, stackTrace) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.brown,
                                content: Text(
                                  "Welcome ${error.toString()}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                            loadingController.loadingCompleted();
                          });
                        }
                        if (snackbarmessage != "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.brown,
                              content: Text(
                                snackbarmessage,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                          snackbarmessage = "";
                          loadingController.loadingCompleted();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width * 0.8,
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                            color: Colors.brown.shade900,
                            borderRadius:
                                BorderRadius.circular(size.width * 0.06)),
                        child: loadingController.isLoading.value
                            ? Padding(
                                padding: EdgeInsets.all(size.width * 0.03),
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.04,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Dont have a Account? "),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: const Text(
                          "SignUp",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap:(){
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              backgroundColor: Colors.brown,
                              title: Column(
                                children: [
                                  Text("Enter Staff Code",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.05),),
                                  SizedBox(
                                    height: size.height*0.03,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding:
                                    EdgeInsets.symmetric(horizontal: size.width * 0.035),
                                    width: size.width * 0.8,
                                    height: size.height * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.brown.shade300,
                                      borderRadius: BorderRadius.circular(size.width * 0.08),
                                    ),
                                    child: TextField(
                                      style: GoogleFonts.roboto(color: Colors.white),
                                      controller: codeController,
                                      cursorColor: Colors.brown,
                                      decoration: InputDecoration(
                                        labelText: "Code",
                                        labelStyle: GoogleFonts.roboto(color: Colors.white),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height*0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(onPressed: (){
                                        Get.back();
                                      }, child: Text("Cancel"),),
                                      ElevatedButton(onPressed: (){
                                        if(codeController.text == '1111')
                                          {
                                            FirebaseAuth.instance.signInWithEmailAndPassword(email: "staff@gmail.com", password: "staff1234").then((value){
                                              Get.back();
                                              Get.off(()=>AdminHome(),transition: Transition.rightToLeft);
                                            });
                                          }
                                      }, child: Text("Submit"),),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                        },
                        child: Text("Staff Member Login.",style: GoogleFonts.roboto(color: Colors.brown,fontSize: size.width*0.05,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: Colors.brown),),),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
