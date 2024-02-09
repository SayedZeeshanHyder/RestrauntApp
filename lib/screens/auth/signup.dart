import 'package:flutter/material.dart';

class SignUp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: null,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back),),
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
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(size.width*0.08),
                ),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: "Username",
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
                    decoration: InputDecoration(
                      labelText: "Password",
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
                    decoration: InputDecoration(
                      labelText: "Phone number",
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
                    decoration: InputDecoration(
                      labelText: "Date of Birth",
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
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    )
                ),
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
                child: Text("Signup",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width*0.04),),
              ),
              SizedBox(height: size.height*0.17,),
              Text("By clicking on SignUp you agree to the following Terms & Conditions",textAlign: TextAlign.center,),
              SizedBox(height: size.height*0.03,),
            ],
          ),
        ),
      ),
    );
  }

}