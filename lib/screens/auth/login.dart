import 'package:flutter/material.dart';
import 'package:mprapp/screens/auth/signup.dart';

class login extends StatelessWidget
{
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
                      Spacer(flex: 2,),
                      Text("Login to your Account"),
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
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: size.height*0.03,),
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
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: size.height*0.01,),
                  Row(
                    children: [
                      Spacer(flex: 7,),
                      Text("Forgot Password?"),
                      Spacer(flex: 2,),
                    ],
                  ),
                  SizedBox(height: size.height*0.05,),
                  Container(
                    alignment: Alignment.center,
                    width: size.width*0.8,
                    height: size.height*0.06,
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.shade700,
                      borderRadius: BorderRadius.circular(size.width*0.06)
                    ),
                    child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.04),),
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