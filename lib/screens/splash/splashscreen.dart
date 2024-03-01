import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprapp/screens/splash/splashservices.dart';

class SplashScreen extends StatefulWidget
{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  SplashServices services = SplashServices();

  @override
  void initState() {
    super.initState();
    services.splash(context);
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to",style: GoogleFonts.dancingScript(fontSize: size.width*0.15,fontWeight: FontWeight.bold,color: Colors.brown),),
            Text("Crimson Royale",style: GoogleFonts.dancingScript(fontSize: size.width*0.15,fontWeight: FontWeight.bold,color: Colors.brown),),
          ],
        ),
      ),
    );
  }
}