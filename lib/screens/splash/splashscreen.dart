import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprapp/controllerfiles/splashanimation.dart';
import 'package:mprapp/screens/splash/splashservices.dart';

class SplashScreen extends StatefulWidget
{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  SplashServices services = SplashServices();
  final splashAnimation = Get.put(SplashAnimation());

  @override
  void initState() {
    super.initState();
    splashAnimation.txt1Animate();
    splashAnimation.txt2Animate();
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
            AnimatedOpacity(opacity: splashAnimation.txt2Op.value,
            duration: const Duration(milliseconds: 1200),
            child: Text("Welcome to",style: GoogleFonts.dancingScript(fontSize: size.width*0.15,fontWeight: FontWeight.bold,color: Colors.brown),)),
            AnimatedOpacity(opacity: splashAnimation.txt2Op.value,
            duration: const Duration(milliseconds: 3000),
            child: Text("Crimson Royale",style: GoogleFonts.dancingScript(fontSize: size.width*0.15,fontWeight: FontWeight.bold,color: Colors.brown),)),
          ],
        ),
      ),
    );
  }
}