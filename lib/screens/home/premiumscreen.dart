import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height*0.10,),
            Text("Get Premium",style: GoogleFonts.roboto(fontSize: size.width*0.09,fontWeight: FontWeight.bold,color: Colors.brown),),
            SizedBox(height: size.height*0.03,),
            Expanded(
              child: Container(
                width: size.width*0.87,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(size.width*0.06)
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      Text("Premium Features",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: size.width*0.06,color: Colors.white),),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
                        child: Divider(thickness: size.width*0.005,color: Colors.white,),
                      ),
                      ListTile(
                        leading: Icon(Icons.check,color: Colors.white,),
                        title: Text("Feature No 1",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.045),),
                      ),
                      ListTile(
                        leading: Icon(Icons.check,color: Colors.white,),
                        title: Text("Feature No 2",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.045),),
                      ),
                      ListTile(
                        leading: Icon(Icons.check,color: Colors.white,),
                        title: Text("Feature No 3",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.045),),
                      ),
                      ListTile(
                        leading: Icon(Icons.check,color: Colors.white,),
                        title: Text("Feature No 4",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.045),),
                      ),
                      ListTile(
                        leading: Icon(Icons.check,color: Colors.white,),
                        title: Text("Feature No 5",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.045),),
                      ),
                      ListTile(
                        leading: Icon(Icons.check,color: Colors.white,),
                        title: Text("Feature No 6",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.045),),
                      ),
                      ListTile(
                        leading: Icon(Icons.check,color: Colors.white,),
                        title: Text("Feature No 7",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.045),),
                      ),
                      ListTile(
                        leading: Icon(Icons.check,color: Colors.white,),
                        title: Text("Feature No 8",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.045),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height*0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: size.width*0.35,
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.03),
                  height: size.height*0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width*0.03),
                    gradient: LinearGradient(
                        colors: [
                          Colors.yellow,
                          Colors.yellow,
                          Colors.white,
                          Colors.yellow,
                          Colors.yellow,
                        ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Text("₹99/Month",style: GoogleFonts.roboto(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: size.width*0.045),),
                ),
                SizedBox(width: size.width*0.1,),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: size.width*0.35,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.07),
                    height: size.height*0.07,
                    decoration: BoxDecoration(
                        color: Colors.brown.shade900,
                        borderRadius: BorderRadius.circular(size.width*0.03)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.close,color: Colors.white,),
                        Text("Close",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: size.width*0.045),),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: size.height*0.045,
            ),
          ],
        ),
      ),
    );
  }
}