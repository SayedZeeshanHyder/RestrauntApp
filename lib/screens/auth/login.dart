import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mprapp/screens/auth/signup.dart';

import '../home/home.dart';

class login extends StatelessWidget
{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              height: size.height*0.55,
              color: Colors.blueAccent,
              child: Icon(Icons.photo),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: size.height*0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(size.width*0.1))
              ),
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Spacer(flex: 3,),
                      Text("Login to your Account",style: TextStyle(fontWeight: FontWeight.w500,fontSize: size.width*0.05),),
                      Spacer(flex: 7,),
                    ],
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.035),
                    width: size.width*0.8,
                    height: size.height*0.07,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(size.width*0.08),
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: size.height*0.01,),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.035),
                    width: size.width*0.8,
                    height: size.height*0.07,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(size.width*0.08),
                    ),
                    child: TextField(
                      controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                    ),
                  ),
                  SizedBox(height: size.height*0.01,),
                  const Row(
                    children: [
                      Spacer(flex: 7,),
                      Text("Forgot Password?"),
                      Spacer(flex: 2,),
                    ],
                  ),
                  SizedBox(height: size.height*0.05,),
                  InkWell(
                    splashFactory: NoSplash.splashFactory,

                    onTap: (){
                      String snackbarmessage="";
                      if(emailController.text.isEmpty)
                        {
                          snackbarmessage="Please Enter Email";
                        }
                      else if(passwordController.text.isEmpty)
                        {
                          snackbarmessage="Please Enter Password";
                        }
                      else{
                        FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.yellowAccent.shade700,content: Text("Welcome ${value.user!.displayName}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),),);
                        });
                      }

                      if(snackbarmessage!="")
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.yellowAccent.shade700,content: Text(snackbarmessage,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),),);
                          snackbarmessage = "";
                        }
                    },

                    child: Container(
                      alignment: Alignment.center,
                      width: size.width*0.8,
                      height: size.height*0.06,
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent.shade700,
                        borderRadius: BorderRadius.circular(size.width*0.06)
                      ),
                      child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.04),),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Dont have a Account? "),
                      SizedBox(width: size.width*0.01,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                        },
                        child: const Text("SignUp",style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),),
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